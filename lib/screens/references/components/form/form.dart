import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/date_input_field.dart';
import 'package:ink_mobile/components/fields/number_select_form_field.dart';
import 'package:ink_mobile/components/ink_drop_down.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/components/textfields/pick_files.dart';
import 'package:ink_mobile/components/textfields/service_btn.dart';
import 'package:ink_mobile/components/textfields/service_textfield.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/cubit/references/references_cubit.dart';
import 'package:ink_mobile/cubit/send_reference_form/send_form_cubit.dart';
import 'package:ink_mobile/functions/parser.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/references/delivery_list.dart';
import 'package:ink_mobile/models/references/reference_list.dart';
import 'package:ink_mobile/screens/references/components/form/entities.dart';
import 'package:ink_mobile/screens/references/components/form/validator.dart';

class ReferencesForm extends StatefulWidget {
  const ReferencesForm({Key? key}) : super(key: key);

  @override
  _ReferencesFormState createState() => _ReferencesFormState();
}

class _ReferencesFormState extends State<ReferencesForm> {
  TextEditingController quantityTextController = TextEditingController();
  TextEditingController periodFromController = TextEditingController();
  TextEditingController periodToController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final GlobalKey<PickFilesState> _pickFilesKey = GlobalKey<PickFilesState>();
  late ReferencesPageCubit referencesCubit;
  late LanguageStrings _strings;
  late ReferencesList referencesList;
  late DeliveryList deliveryList;
  late ReferencesFormEntities entities = ReferencesFormEntities();
  late ReferencesItem currentReferenceItem;
  late DeliveryItem? deliveryItem;
  late ReferencesFormValidator validatorMixin;
  late SendReferenceFormCubit _sendReferenceFormCubit;

  int stage = 1;

  void setStage(int newStage) {
    if (stage != newStage) {
      stage = newStage;
    }
  }

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    referencesList = ReferencesList(strings: _strings);
    deliveryList = DeliveryList(strings: _strings);
    referencesCubit = BlocProvider.of<ReferencesPageCubit>(context);
    _sendReferenceFormCubit = BlocProvider.of<SendReferenceFormCubit>(context);
    currentReferenceItem =
        referencesList.getReferenceItemByInt(entities.referencesType ?? 1)!;

    deliveryItem = deliveryList.getCurrentDeliveryItem(
        currentReferenceItem, entities.deliveryType);

    validatorMixin = ReferencesFormValidator(
        strings: _strings, formKey: _key, referencesItem: currentReferenceItem);

    bool deliveryAddress = deliveryList.canBeAddressDelivered(
        currentReferenceItem, entities.deliveryType);

    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkDropDown(
              hint: _strings.choose,
              selectedIndex: entities.referencesType,
              items: referencesList.getListTitles(),
              onChanged: (int index) {
                entities.referencesType = index;
                setStage(2);
                clearForm();
              },
            ),
            if (stage == 2) ...[
              if (currentReferenceItem.fields.fio) ...[
                SizedBox(height: 20),
                fioWidget(),
              ],
              if (currentReferenceItem.fields.position) ...[
                SizedBox(height: 20),
                positionWidget(),
              ],
              if (currentReferenceItem.fields.department) ...[
                SizedBox(height: 20),
                departmentWidget(),
              ],
              if (currentReferenceItem.fields.fioChildren) ...[
                SizedBox(height: 20),
                childsFioWidget(),
              ],
              if (currentReferenceItem.fields.files) ...[
                SizedBox(height: 20),
                fileWidget(),
              ],
              if (currentReferenceItem.fields.phone) ...[
                SizedBox(height: 20),
                contactPhoneWidget(),
              ],
              if (currentReferenceItem.fields.delivery) ...[
                SizedBox(height: 20),
                deliveryMethodWidget(),
              ],
              if (deliveryAddress) ...[
                SizedBox(height: 20),
                deliveryAddressWidget(),
                SizedBox(height: 20),
                deliveryZipCodeWidget(),
              ],
              if (currentReferenceItem.fields.quantity) ...[
                SizedBox(height: 20),
                Text(_strings.countInstances),
                SizedBox(height: 15),
                quantityWidget(),
              ],
              if (currentReferenceItem.fields.toProvideIn) ...[
                SizedBox(height: 20),
                toProvideInWidget(),
              ],
              if (currentReferenceItem.fields.period) ...[
                SizedBox(height: 20),
                periodWidget(),
              ],
              if (currentReferenceItem.fields.periodFrom) ...[
                SizedBox(height: 20),
                periodFromWidget(),
              ],
              if (currentReferenceItem.fields.periodTo) ...[
                SizedBox(height: 20),
                periodToWidget(),
              ],
              if (currentReferenceItem.description.length > 0) ...[
                SizedBox(height: 20),
                descriptionWidget(),
              ],
              SizedBox(height: 20),
              btnWidget(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget fioWidget() {
    return ServiceTextField(
      hint: _strings.fullnameHint,
      initialValue: referencesCubit.autofill.fio,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.fio = val,
    );
  }

  Widget positionWidget() {
    return ServiceTextField(
      hint: _strings.position,
      initialValue: referencesCubit.autofill.position,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.position = val,
    );
  }

  Widget departmentWidget() {
    return ServiceTextField(
      hint: _strings.department,
      initialValue: referencesCubit.autofill.department,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.department = val,
    );
  }

  Widget childsFioWidget() {
    return ServiceTextField(
      hint: _strings.childsFullname,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.fioChildren = val,
    );
  }

  Widget fileWidget() {
    return PickFiles(
      key: _pickFilesKey,
      title: _strings.childsBirthCertificate,
      titleStyle: TextStyle(fontSize: 16.0),
      onSuccesfullyPicked: (List<File> files) => entities.files = files,
    );
  }

  Widget contactPhoneWidget() {
    return ServiceTextField(
      hint: _strings.contactPhone,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.phone = val,
      keyboardType: TextInputType.number,
    );
  }

  Widget deliveryMethodWidget() {
    return InkDropDown(
      hint: _strings.deliveryMethod,
      items: deliveryList.getDeliveryItemsList(currentReferenceItem),
      selectedIndex: entities.deliveryType,
      onChanged: (int index) {
        setState(() {
          entities.deliveryType = index;
        });
      },
    );
  }

  Widget deliveryAddressWidget() {
    return ServiceTextField(
      hint: _strings.address,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.address = val,
    );
  }

  Widget deliveryZipCodeWidget() {
    return ServiceTextField(
      hint: _strings.zipIndex,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.postCode = val,
    );
  }

  Widget quantityWidget() {
    quantityTextController.text = '1';
    return NumberSelectFormField(
      controller: quantityTextController,
      buttonsColor: ButtonsColor(
        left: Color(0xFF4E6D49),
        right: Color(0xFF4E6D49),
      ),
      changeValueBy: 1,
      mode: NumberSelectFieldMode.int,
      onlyPositive: true,
      onChanged: (val) {
          entities.quantity = Parser.stringToInt(val);
          if (entities.quantity < 1) {
            entities.quantity = 1;
            quantityTextController.text = '1';
          }
        },
      validator: (value) {},
      style: TextStyle(fontSize: 30, height: 1),
      textAlignVertical: TextAlignVertical.center,
      flex: NumberSelectFieldFlex(
        buttons: 4,
        textField: 5,
      ),
      height: 50,
      width: 200,
    );
  }

  Widget toProvideInWidget() {
    return ServiceTextField(
      hint: _strings.toSubmitFor,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.toProvideIn = val,
    );
  }

  Widget periodWidget() {
    return ServiceTextField(
      hint: _strings.period,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.period = val,
    );
  }

  Widget periodFromWidget() {
    return DateInputField(
      controller: periodFromController,
      title: _strings.periodStart,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.periodFrom = val,
    );
  }

  Widget periodToWidget() {
    return DateInputField(
      controller: periodToController,
      title: _strings.periodEnd,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.periodTo = val,
    );
  }

  Widget descriptionWidget() {
    return Text(
      currentReferenceItem.description,
      style: TextStyle(color: Colors.red),
    );
  }

  Widget btnWidget(BuildContext context) {
    return BlocConsumer<SendReferenceFormCubit, BtnCubitState>(
      listener: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.ERROR) {
          SimpleCustomSnackbar(context: context, txt: state.message);
        }
        if (state.state == BtnCubitStateEnums.SUCCESS) {
          clearForm();
          SuccessCustomSnackbar(
            context: context,
            txt: state.message,
            duration: Duration(seconds: 3),
          );
        }
      },
      builder: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.SENDING) {
          return CustomCircularProgressIndicator();
        } else {
          return ServiceBtn(
            onPressed: () {
              if (validatorMixin.validateForm(context, entities)) {
                _sendReferenceFormCubit.send(
                  entities: entities,
                  referencesItem: currentReferenceItem,
                  deliveryItem: deliveryItem!,
                );
              }
            },
            txt: _strings.order,
          );
        }
      },
    );
  }

  void clearForm() {
    _key.currentState!.reset();
    entities.clear();
    if (_pickFilesKey.currentState != null) {
      _pickFilesKey.currentState!.clearAll();
    }
    setState(() {});
  }
}
