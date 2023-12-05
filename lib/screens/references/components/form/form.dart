import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/date_input_field.dart';
import 'package:ink_mobile/components/fields/number_select_form_field.dart';
import 'package:ink_mobile/components/ink_drop_down.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/components/textfields/pick_files.dart';
import 'package:ink_mobile/components/textfields/service_btn.dart';
import 'package:ink_mobile/components/textfields/service_textfield.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/core/masks/input_formatters.dart';
import 'package:ink_mobile/core/masks/textfield_masks.dart';
import 'package:ink_mobile/core/validator/field_validator.dart';
import 'package:ink_mobile/cubit/profile/profile_cubit.dart';
import 'package:ink_mobile/cubit/profile/profile_state.dart';
import 'package:ink_mobile/cubit/references/references_cubit.dart';
import 'package:ink_mobile/cubit/send_reference_form/send_form_cubit.dart';
import 'package:ink_mobile/functions/parser.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/models/references/delivery_list.dart';
import 'package:ink_mobile/models/references/reference_list.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/profile_screen.dart';
import 'package:ink_mobile/screens/references/components/form/checkbox_component.dart';
import 'package:ink_mobile/screens/references/components/form/entities.dart';
import 'package:ink_mobile/screens/references/components/form/validator.dart';
import 'package:ink_mobile/screens/service_list/service_list_page_viewer.dart';
import 'package:ink_mobile/setup.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ReferencesForm extends StatefulWidget {
  final ReferencesPageCubit referencesPageCubit;
  final SendReferenceFormCubit sendReferenceFormCubit;
  final bool isTablet;
  const ReferencesForm({
    Key? key,
    required this.referencesPageCubit,
    required this.sendReferenceFormCubit,
    required this.isTablet,
  }) : super(key: key);

  @override
  State<ReferencesForm> createState() => _ReferencesFormState();
}

class _ReferencesFormState extends State<ReferencesForm> {
  TextEditingController quantityTextController = TextEditingController();
  TextEditingController periodFromController = TextEditingController();
  TextEditingController periodToController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final GlobalKey<PickFilesState> _pickFilesKey = GlobalKey<PickFilesState>();
  late AppLocalizations _strings;
  late ReferencesList referencesList;
  late DeliveryList deliveryList;
  late ReferencesFormEntities entities = ReferencesFormEntities();
  late ReferencesItem currentReferenceItem;
  late DeliveryItem? deliveryItem;
  late ReferencesFormValidator validatorMixin;
  bool showEmail = false;
  bool deliveryPostMail = false;
  bool activeButton = true;
  String email = '';
  int stage = 1;
  final emailService = getIt<ProfileCubit>();

  void setStage(int newStage) {
    if (stage != newStage) {
      stage = newStage;
    }
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

    referencesList = ReferencesList();
    deliveryList = DeliveryList();
    currentReferenceItem =
        referencesList.getReferenceItemByInt(entities.referencesType ?? 1)!;

    deliveryItem = deliveryList.getCurrentDeliveryItem(
        currentReferenceItem, entities.deliveryType);

    validatorMixin = ReferencesFormValidator(
        strings: _strings, formKey: _key, referencesItem: currentReferenceItem);

    bool deliveryAddress = deliveryList.canBeAddressDelivered(
        currentReferenceItem, entities.deliveryType);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                const SizedBox(height: 20),
                fioWidget(),
              ],
              if (currentReferenceItem.fields.position) ...[
                const SizedBox(height: 20),
                positionWidget(),
              ],
              if (currentReferenceItem.fields.department) ...[
                const SizedBox(height: 20),
                departmentWidget(),
              ],
              if (currentReferenceItem.fields.fioChildren) ...[
                const SizedBox(height: 20),
                childsFioWidget(),
              ],
              if (currentReferenceItem.fields.files) ...[
                const SizedBox(height: 20),
                fileWidget(),
              ],
              if (currentReferenceItem.fields.phone) ...[
                const SizedBox(height: 20),
                contactPhoneWidget(),
              ],
              if (currentReferenceItem.fields.delivery) ...[
                const SizedBox(height: 20),
                deliveryMethodWidget(context)
              ],
              if (showEmail) ...[
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: deliveryMethod(context)),
                ConfirmCheckboxesEmail(
                  onChange: (bool value) {
                    setState(() {
                      activeButton = value;
                    });
                  },
                ),
              ],
              if (deliveryPostMail) ...[
                const SizedBox(height: 10),
                ConfirmCheckboxesPostMail(
                  onChange: (bool value) {
                    setState(() {
                      activeButton = value;
                    });
                  },
                ),
              ],
              if (deliveryAddress) ...[
                const SizedBox(height: 20),
                deliveryAddressWidget(),
                const SizedBox(height: 20),
                deliveryZipCodeWidget(),
              ],
              if (currentReferenceItem.fields.quantity) ...[
                const SizedBox(height: 20),
                Text(
                  _strings.countInstances,
                  style: TextStyle(fontSize: widget.isTablet ? 18 : 14),
                ),
                const SizedBox(height: 15),
                quantityWidget(),
              ],
              if (currentReferenceItem.fields.toProvideIn) ...[
                const SizedBox(height: 20),
                toProvideInWidget(),
              ],
              if (currentReferenceItem.fields.period) ...[
                const SizedBox(height: 20),
                periodWidget(),
              ],
              if (currentReferenceItem.fields.periodFrom) ...[
                const SizedBox(height: 20),
                periodFromWidget(),
              ],
              if (currentReferenceItem.fields.periodTo) ...[
                const SizedBox(height: 20),
                periodToWidget(),
              ],
              if (currentReferenceItem.description.isNotEmpty) ...[
                const SizedBox(height: 20),
                descriptionWidget(),
              ],
              const SizedBox(height: 20),
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
      initialValue: widget.referencesPageCubit.autofill.fio,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.fio = val,
      focusNode: FocusNode(),
    );
  }

  Widget positionWidget() {
    return ServiceTextField(
      hint: _strings.position,
      initialValue: widget.referencesPageCubit.autofill.position,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.position = val,
      focusNode: FocusNode(),
    );
  }

  Widget departmentWidget() {
    return ServiceTextField(
      hint: _strings.department,
      initialValue: widget.referencesPageCubit.autofill.department,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.department = val,
      focusNode: FocusNode(),
    );
  }

  Widget childsFioWidget() {
    return ServiceTextField(
      hint: _strings.childFullName,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.fioChildren = val,
      focusNode: FocusNode(),
    );
  }

  Widget fileWidget() {
    return PickFiles(
      key: _pickFilesKey,
      title: _strings.childBirthCertificate,
      titleStyle: const TextStyle(fontSize: 16.0),
      onSuccesfullyPicked: (List<File> files) => entities.files = files,
    );
  }

  Widget contactPhoneWidget() {
    MaskTextInputFormatter mask = TextFieldMasks().phone();
    return ServiceTextField(
      hint: "+7 (ххх) xxx-xx-xx",
      validator: (val) => val!.length < 17 ? _strings.fillTheField : null,
      onChanged: (val) => entities.phone = val,
      keyboardType: TextInputType.phone,
      inputFormatters: [mask],
      focusNode: FocusNode(),
    );
  }

  Widget deliveryMethodWidget(BuildContext context) {
    return InkDropDown(
      hint: _strings.deliveryMethod,
      items: deliveryList.getDeliveryItemsList(currentReferenceItem),
      selectedIndex: entities.deliveryType,
      onChanged: (int index) {
        setState(() {
          if (deliveryList.getDeliveryItemsList(currentReferenceItem)[index] ==
              localizationInstance.deliveryMethodPostMail) {
            deliveryPostMail = true;
            activeButton = false;
            showEmail = false;
          } else if (deliveryList
                  .getDeliveryItemsList(currentReferenceItem)[index] ==
              localizationInstance.deliveryMethodEmail) {
            showEmail = true;
            activeButton = false;
            deliveryPostMail = false;
          } else {
            showEmail = false;
            activeButton = true;
            deliveryPostMail = false;
          }
          entities.deliveryType = index;
        });
      },
    );
  }

  Widget deliveryMethod(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.data != null) {
          final user = User(
            id: state.data!.id,
            name: "${state.data!.lastName ?? ""} ${state.data!.name ?? ""}",
            avatarUrl: state.data!.pathToAvatar ?? "",
            absence: state.data!.absence,
          );
          getIt<CachedUsersCubit>().removeAndAddUser(user, user.id);
        }
      },
      bloc: emailService,
      builder: (context, state) {
        switch (state.type) {
          case ProfileStateType.LOADED:
          case ProfileStateType.OTHER_USER_LOADED:
            {
              return getLoadedStateWidget(context, state);
            }

          case ProfileStateType.LOADING:
            {
              emailService.fetchUser(context);
              return const SizedBox();
            }

          case ProfileStateType.ERROR:
            {
              return _getErrorStateWidget(context, state);
            }
        }
      },
    );
  }

  Widget deliveryAddressWidget() {
    return ServiceTextField(
      hint: _strings.address,
      validator: (val) => FieldValidator(_strings).addressValidator(val!),
      onChanged: (val) => entities.address = val,
      keyboardType: TextInputType.streetAddress,
      autocorrect: false,
      focusNode: FocusNode(),
    );
  }

  Widget deliveryZipCodeWidget() {
    return ServiceTextField(
      hint: _strings.zipIndex,
      validator: (val) => FieldValidator(_strings).zipCodeValidator(val!),
      onChanged: (val) => entities.postCode = val,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
    );
  }

  Widget quantityWidget() {
    quantityTextController.text = entities.quantity.toString();
    return NumberSelectFormField(
      min: 1,
      controller: quantityTextController,
      buttonsColor: const ButtonsColor(
        left: Color(0xFF4E6D49),
        right: Color(0xFF4E6D49),
      ),
      changeValueBy: 1,
      mode: NumberSelectFieldMode.int,
      onlyPositive: true,
      onChanged: (val) => entities.quantity = Parser(val: val).stringToInt(),
      validator: (value) {
        return null;
      },
      style: const TextStyle(fontSize: 30, height: 1),
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
      validator: (val) => val!.length < 2 ? _strings.fillTheField : null,
      onChanged: (val) => entities.toProvideIn = val,
      focusNode: FocusNode(),
    );
  }

  Widget periodWidget() {
    return ServiceTextField(
      hint: _strings.period,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.period = val,
      inputFormatters: [InputFormatters().lettersNumbersOnly],
      focusNode: FocusNode(),
    );
  }

  Widget periodFromWidget() {
    return DateInputField(
      hintText: 'Начало периода',
      controller: periodFromController,
      title: _strings.periodStart,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.periodFrom = val,
    );
  }

  Widget periodToWidget() {
    return DateInputField(
      hintText: 'Конец периода',
      controller: periodToController,
      title: _strings.periodEnd,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.periodTo = val,
    );
  }

  Widget descriptionWidget() {
    return Text(
      currentReferenceItem.description,
      style: TextStyle(color: Colors.red, fontSize: widget.isTablet ? 18 : 14),
    );
  }

  Widget btnWidget(BuildContext context) {
    return BlocConsumer<SendReferenceFormCubit, BtnCubitState>(
      bloc: widget.sendReferenceFormCubit,
      listener: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.ERROR) {
          SimpleCustomSnackbar(context: context, txt: state.message);
        }
        if (state.state == BtnCubitStateEnums.SUCCESS) {
          clearForm();
          SuccessCustomSnackbar(
            context: context,
            txt: state.message,
            duration: const Duration(seconds: 3),
          );
        }
      },
      builder: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.SENDING) {
          return const CustomCircularProgressIndicator();
        } else {
          return ServiceBtn(
            onPressed: () async {
              if (activeButton) {
                if (validatorMixin.validateForm(context, entities)) {
                  final sent = await widget.sendReferenceFormCubit.send(
                    entities: entities,
                    referencesItem: currentReferenceItem,
                    deliveryItem: deliveryItem!,
                  );

                  if (sent) {
                    setState(() {
                      stage = 1;
                    });

                    ServiceListPageViewerState.pageViewer.pageController
                        .jumpToPage(0);
                  }
                }
              } else {}
            },
            txt: activeButton ? _strings.order : 'Заполните все поля',
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

  Widget _getErrorStateWidget(BuildContext context, ProfileState state) {
    final cubit = ProfileScreen.of(context).profileCubit;

    return ErrorRefreshButton(
      onTap: cubit.refresh,
      text: state.errorMessage!,
    );
  }

  Widget getLoadedStateWidget(BuildContext context, ProfileState state) {
    UserProfileData user = state.data!;
    String email = 'Email: ';
    String userEmail = user.contacts?.email ?? '';
    return Text(
      email + userEmail,
      style: FontStyles.rubikP2(color: Palette.textBlack),
    );
  }
}
