import 'package:flutter/material.dart';
import 'package:ink_mobile/assets/constants.dart';

class ErrorRefreshButton extends StatelessWidget {
  const ErrorRefreshButton({
    Key? key,
    required this.onTap,
    this.buttonText = 'Обновить',
    this.text = ErrorMessages.SIMPLE_ERROR_MESSAGE
  }) : super(key: key);

  final Function onTap;
  final String buttonText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color?>(
                      Theme.of(context).primaryColor
                  )
              ),
              onPressed: () {
                onTap();
              },
              child: Text(
                'Обновить',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            )
          ],
        )
    );
  }
}
