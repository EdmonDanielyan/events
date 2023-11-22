import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/feedback/components/select_file_dialog.dart';
import 'package:path/path.dart';
import '../../functions/errors.dart';

const _blockedDirectory = "externalstorage";

class PickFiles extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final void Function(List<File>) onSuccesfullyPicked;
  const PickFiles({
    Key? key,
    required this.onSuccesfullyPicked,
    this.title = "Файлы",
    this.titleStyle,
  }) : super(key: key);

  @override
  PickFilesState createState() => PickFilesState();
}

class PickFilesState extends State<PickFiles> {
  final String noFilePicked = "Файл не выбран";
  List<File> pickedFiles = [];

  Future<void> _pickFile(FileType fileType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowedExtensions: fileType == FileType.custom
          ? ["jpg", "jpeg", "png", "doc", "docx", "xls", "xlsx", "pdf"]
          : null,
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      if (result.files.single.identifier != null &&
          result.files.single.identifier!.contains(_blockedDirectory)) {
        showErrorDialog(localizationInstance.incorrectDirectory);
        return;
      }

      setState(() {
        pickedFiles.add(file);
      });

      widget.onSuccesfullyPicked(pickedFiles);
    }
  }

  void _removeFile(int index) {
    if (hasElement(index)) {
      setState(() {
        pickedFiles.removeAt(index);
      });
      widget.onSuccesfullyPicked(pickedFiles);
    }
  }

  void clearAll() {
    setState(() {
      pickedFiles = [];
    });

    widget.onSuccesfullyPicked(pickedFiles);
  }

  bool hasElement(int index) => pickedFiles.asMap().containsKey(index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _btnWidget(context),
        const SizedBox(height: 24.0),
        if (pickedFiles.isEmpty) _fileStatusWidget(context),
        ...List.generate(pickedFiles.length, (index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _fileStatusWidget(
                    context, hasElement(index) ? pickedFiles[index] : null),
              ),
              if (hasElement(index)) ...[
                _deleteItemWidget(index),
              ],
            ],
          );
        }),
      ],
    );
  }

  Widget _btnWidget(BuildContext context) {
    return DefaultButton(
      title: localizationInstance.attachFile,
      onTap: () {
        CustomBottomSheet(
          context: context,
          child: SelectFileDialog(
            onGallery: () => _pickFile(FileType.media),
            onFiles: () => _pickFile(FileType.custom),
          ),
        );
      },
      borderColor: Palette.greenE4A,
      textColor: Palette.greenE4A,
      suffixIcon: SvgPicture.asset(IconLinks.ATTACHMENT_ICON,
          colorFilter: ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn),
          height: 20.0,
          width: 20.0),
    );
  }

  Widget _fileStatusWidget(BuildContext context, [File? file]) {
    return Text(
      file == null ? noFilePicked : basename(file.path),
      style: FontStyles.rubikP1Medium(color: Palette.textBlack),
      maxLines: 1,
    );
  }

  Widget _deleteItemWidget(int index) {
    return IconButton(
      onPressed: () => _removeFile(index),
      icon: SvgPicture.asset(IconLinks.CLOSE_ICON,
          colorFilter: ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn),
          width: 20.0,
          height: 20.0),
    );
  }
}
