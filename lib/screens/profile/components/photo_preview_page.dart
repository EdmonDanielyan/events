import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ink_mobile/components/textfields/service_btn.dart';

class PhotoPreviewPage extends StatelessWidget {
  final File? file;
  final String? url;
  const PhotoPreviewPage({Key? key, this.file, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              if (file != null) ...[
                Expanded(
                    child: Image.file(
                  file!,
                  height: 700,
                )),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ServiceBtn(
                    txt: 'Сохранить',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ] else if (url != null && url != '')
                Image.network(url!),
            ],
          ),
        ),
      ),
    );
  }
}
