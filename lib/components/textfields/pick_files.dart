import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/components/bottom_sheet.dart';
import 'package:ink_mobile/screens/feedback/components/select_file_dialog.dart';
import 'package:path/path.dart';

class PickFiles extends StatefulWidget {
  final String title;
  final TextStyle titleStyle;
  final void Function(List<File>) onSuccesfullyPicked;
  const PickFiles({
    Key? key,
    required this.onSuccesfullyPicked,
    this.title = "Файлы",
    this.titleStyle = const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
    ),
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
        Text(
          widget.title,
          style: widget.titleStyle,
        ),
        SizedBox(height: 5.0),
        Column(
          children: List.generate(
            pickedFiles.length + 1,
            (index) => Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _btnWidget(context),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: _fileStatusWidget(
                        hasElement(index) ? pickedFiles[index] : null),
                  ),
                  if (hasElement(index)) ...[
                    _deleteItemWidget(index),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _btnWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () {
          CustomBottomSheet(
            context: context,
            child: SelectFileDialog(
              onGallery: () => _pickFile(FileType.media),
              onFiles: () => _pickFile(FileType.custom),
            ),
          );
        },
        child: Text("Выбрать файл"),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(11.0),
        ),
      ),
    );
  }

  Widget _fileStatusWidget(File? file) {
    return Text(
      file == null ? noFilePicked : basename(file.path),
      style: const TextStyle(color: Colors.grey),
      maxLines: 1,
    );
  }

  Widget _deleteItemWidget(int index) {
    return IconButton(
      onPressed: () => _removeFile(index),
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}
