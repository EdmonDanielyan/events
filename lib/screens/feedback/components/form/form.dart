import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/components/textfields/pick_files.dart';
import 'package:ink_mobile/components/textfields/service_btn.dart';
import 'package:ink_mobile/components/textfields/service_selectfield_cubit.dart';
import 'package:ink_mobile/components/textfields/service_textfield.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/core/validator/field_validator.dart';
import 'package:ink_mobile/cubit/send_feedback_form/send_form_cubit.dart';
import 'package:ink_mobile/cubit/tags_list/tags_list_cubit.dart';
import 'package:ink_mobile/cubit/tags_list/tags_list_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/selectfield.dart';
import 'package:ink_mobile/screens/feedback/components/form/validator.dart';
import 'package:ink_mobile/screens/feedback/components/success_screen.dart';
import 'package:ink_mobile/screens/service_list/service_list_page_viewer.dart';

import '../../feedback_screen.dart';
import 'entities.dart';

class ManagementFeedbackForm extends StatefulWidget {
  const ManagementFeedbackForm({Key? key}) : super(key: key);

  @override
  _ManagementFeedbackFormState createState() => _ManagementFeedbackFormState();
}

class _ManagementFeedbackFormState extends State<ManagementFeedbackForm> {
  late ManagementFeedbackFormValidator _validator;
  late ManagementFeedbackFormEntities entities =
      ManagementFeedbackFormEntities();

  final _formKey = GlobalKey<FormState>();
  late SendManagementFormCubit sendManagementFormCubit;
  late SelectfieldCubit selectfieldCubit;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<PickFilesState> _pickFilesKey = GlobalKey<PickFilesState>();
    final _strings = localizationInstance;
    final size = MediaQuery.of(context).size;
    _validator = ManagementFeedbackFormValidator();

    sendManagementFormCubit =
        FeedBackScreen.of(context).sendManagementFormCubit;

    selectfieldCubit = FeedBackScreen.of(context).selectfieldCubit;

    return SingleChildScrollView(
      controller:
      FeedBackScreen.of(context).scrollBottomLoadMoreCubit.scrollController,
      child: Container(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _selectAddresseesWidget(entities: entities),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ServiceTextField(
                    hint: "${_strings.fullnameHint} ${_strings.notRequired}",
                    onChanged: (val) => entities.name = val,
                    descriptionText: localizationInstance.optionalInitials,
                  ),
                ),
                Text(
                  localizationInstance.feedbackRecommendation,
                  style: FontStyles.rubikP2(color: Palette.textBlack50),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ServiceTextField(
                    hint: "${_strings.email} ${_strings.notRequired}",
                    validator: (val) => FieldValidator(_strings)
                        .emailValidator(val, canBeEmpty: true),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    onChanged: (val) => entities.email = val,
                    descriptionText: localizationInstance.optionalEmail,
                  ),
                ),
                ServiceTextField(
                  validator: _validator.questionValidator,
                  hint: _strings.question,
                  keyboardType: TextInputType.multiline,
                  onChanged: (val) => entities.question = val,
                  descriptionText: localizationInstance.yourQuestion,
                ),
                const SizedBox(height: 24.0,),
                PickFiles(
                  key: _pickFilesKey,
                  onSuccesfullyPicked: (List<File> files) => entities.files = files,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    _strings.feedbackFormHint,
                    style: FontStyles.rubikP2(color: Palette.textBlack50),
                  ),
                ),
                Text(
                  _strings.companyRight,
                  style: FontStyles.rubikP2(color: Palette.textBlack50),
                ),
                const SizedBox(height: 24.0,),
                _btnWidget(_formKey, _pickFilesKey, entities),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectAddresseesWidget(
      {required ManagementFeedbackFormEntities entities}) {
    final tagsListCubit = FeedBackScreen.of(context).tagsListCubit;
    return BlocBuilder<TagsListCubit, TagsListCubitState>(
      bloc: tagsListCubit,
      builder: (BuildContext context, state) {
        if (state.state == TagsListCubitStateEnums.LOADING) {
          tagsListCubit.load();
        }

        List<Selectfield> getItems =
            state.state == TagsListCubitStateEnums.SUCCESS ? state.data : [];
        return IgnorePointer(
          ignoring: state.data.length < 1,
          child: ServiceSelectFieldCubit(
            hint:
                "${localizationInstance.topic} (${localizationInstance.markMultiple})",
            cubit: selectfieldCubit,
            items: getItems,
            validator: (_) => _validator.toWhomValidator(entities.toWhom),
            onChanged: (val) => entities.toWhom = val,
            descriptionText: localizationInstance.theme,
          ),
        );
      },
    );
  }

  Widget _btnWidget(
      GlobalKey<FormState> key,
      GlobalKey<PickFilesState> pickFilesKey,
      ManagementFeedbackFormEntities entities) {
    return BlocConsumer<SendManagementFormCubit, BtnCubitState>(
      bloc: sendManagementFormCubit,
      listener: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.ERROR) {
          SimpleCustomSnackbar(context: context, txt: state.message);
        }
        if (state.state == BtnCubitStateEnums.SUCCESS) {
          clearForm(formKey: key, pickFilesKey: pickFilesKey);
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) {
                return SuccessScreen(
                  onDismiss: (screenContext) {
                    Navigator.of(screenContext).pop();
                    ServiceListPageViewerState.pageViewer.pageController
                        .jumpToPage(0);
                  },
                  onSendNew: (screenContext) {
                    Navigator.of(screenContext).pop();
                  },
                );
              }));
        }
      },
      builder: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.SENDING) {
          return CustomCircularProgressIndicator();
        } else {
          return ServiceBtn(
            txt: localizationInstance.askQuestion,
            onPressed: () {
              if (key.currentState!.validate()) {
                sendManagementFormCubit.send(entities);
              }
            },
          );
        }
      },
    );
  }

  void clearForm(
      {required GlobalKey<FormState> formKey,
      required GlobalKey<PickFilesState> pickFilesKey}) {
    pickFilesKey.currentState!.clearAll();
    formKey.currentState!.reset();
    selectfieldCubit.clear();
  }
}
