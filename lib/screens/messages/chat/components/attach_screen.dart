import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class ChatAttachScreen extends StatelessWidget {
  const ChatAttachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return CustomBottomSheetChild(
      title: _strings.attach,
      cancelBtnTxt: _strings.cancel,
      showSubmitBtn: false,
      child: Column(
        children: [
          Text("TAKE A PICTURE"),
        ],
      ),
    );
  }
}
