import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/components/textfields/pick_files.dart';
import 'package:ink_mobile/components/textfields/service_btn.dart';
import 'package:ink_mobile/components/textfields/service_selectfield.dart';
import 'package:ink_mobile/components/textfields/service_textfield.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/cubit/send_feedback_form/send_form_cubit.dart';
import 'package:ink_mobile/cubit/tags_list/tags_list_cubit.dart';
import 'package:ink_mobile/cubit/tags_list/tags_list_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/selectfield.dart';
import 'package:ink_mobile/screens/feedback/components/form/validator.dart';
import 'package:ink_mobile/screens/feedback/components/hint_text.dart';

import 'entities.dart';

class ManagementFeedbackForm extends StatelessWidget {
  const ManagementFeedbackForm({Key? key}) : super(key: key);
  static late LanguageStrings _strings;
  static late ManagementFeedbackFormValidator _validator;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<PickFilesState> _pickFilesKey = GlobalKey<PickFilesState>();
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    _validator = ManagementFeedbackFormValidator(strings: _strings);

    final _formKey = GlobalKey<FormState>();
    final _formCubit = BlocProvider.of<SendManagementFormCubit>(context);

    final _addresseeCubit = BlocProvider.of<TagsListCubit>(context);
    final _selectfieldCubit = BlocProvider.of<SelectfieldCubit>(context);
    ManagementFeedbackFormEntities entities = ManagementFeedbackFormEntities();

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _selectAddresseesWidget(
              entities: entities,
              addresseeCubit: _addresseeCubit,
              selectfieldCubit: _selectfieldCubit,
            ),
            SizedBox(height: 20.0),
            ServiceTextField(
              hint: "${_strings.fullnameHint} ${_strings.notRequired}",
              onChanged: (val) => entities.name = val,
            ),
            SizedBox(height: 20.0),
            ServiceTextField(
              hint: "${_strings.email} ${_strings.notRequired}",
              validator: _validator.emailValidator,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              onChanged: (val) => entities.email = val,
            ),
            SizedBox(height: 20.0),
            ServiceTextField(
              validator: _validator.questionValidator,
              hint: _strings.question,
              keyboardType: TextInputType.multiline,
              onChanged: (val) => entities.question = val,
            ),
            SizedBox(height: 10.0),
            FeedbackHintText(txt: _strings.feedbackFormHint),
            SizedBox(height: 20.0),
            PickFiles(
              key: _pickFilesKey,
              onSuccesfullyPicked: (List<File> files) => entities.files = files,
            ),
            SizedBox(height: 20.0),
            _btnWidget(_formKey, _pickFilesKey, _formCubit, _selectfieldCubit,
                entities),
          ],
        ),
      ),
    );
  }

  Widget _selectAddresseesWidget(
      {required TagsListCubit addresseeCubit,
      required SelectfieldCubit selectfieldCubit,
      required ManagementFeedbackFormEntities entities}) {
    return BlocBuilder<TagsListCubit, TagsListCubitState>(
      builder: (BuildContext context, state) {
        if (state.state == TagsListCubitStateEnums.LOADING) {
          addresseeCubit.load();
        }

        List<Selectfield> getItems =
            state.state == TagsListCubitStateEnums.SUCCESS ? state.data : [];
        return IgnorePointer(
          ignoring: state.data.length < 1,
          child: ServiceSelectField(
            hint: _strings.addresseeHint,
            cubit: selectfieldCubit,
            items: getItems,
            validator: (_) => _validator.toWhomValidator(entities.toWhom),
            onChanged: (val) => entities.toWhom = val,
          ),
        );
      },
    );
  }

  Widget _btnWidget(
      GlobalKey<FormState> key,
      GlobalKey<PickFilesState> pickFilesKey,
      SendManagementFormCubit formCubit,
      SelectfieldCubit selectCubit,
      ManagementFeedbackFormEntities entities) {
    return BlocConsumer<SendManagementFormCubit, BtnCubitState>(
      listener: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.ERROR) {
          SimpleCustomSnackbar(context: context, txt: state.message);
        }
        if (state.state == BtnCubitStateEnums.SUCCESS) {
          clearForm(
              formKey: key,
              selectfieldCubit: selectCubit,
              pickFilesKey: pickFilesKey);
          SuccessCustomSnackbar(context: context, txt: state.message);
        }
      },
      builder: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.SENDING) {
          return CustomCircularProgressIndicator();
        } else {
          return ServiceBtn(
              txt: _strings.askQuestion,
              onPressed: () {
                if (key.currentState!.validate()) {
                  formCubit.send(entities);
                }
              });
        }
      },
    );
  }

  void clearForm(
      {required GlobalKey<FormState> formKey,
      required SelectfieldCubit selectfieldCubit,
      required GlobalKey<PickFilesState> pickFilesKey}) {
    pickFilesKey.currentState!.clearAll();
    formKey.currentState!.reset();
    selectfieldCubit.clear();
  }
}
