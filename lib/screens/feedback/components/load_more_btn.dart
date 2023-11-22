import 'package:flutter/material.dart';

import '../../../messenger/functions/size_config.dart';

class LoadMoreBtn extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const LoadMoreBtn({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 13,
              offset: const Offset(0, 1)),
        ]),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize:
                      SizeConfig(context, 16.0).getProportionateScreenHeight,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
