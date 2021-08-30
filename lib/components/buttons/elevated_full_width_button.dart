import 'package:flutter/material.dart';

class ElevatedFullWidthButton extends StatelessWidget {
  final String title;
  final String link;

  const ElevatedFullWidthButton({
    Key? key,
    required this.title,
    required this.link
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2.0),
        width: size.width,
        height: 50,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(1, 4)
              )
            ],
          ),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, link);
              },
              child: Container(
                child:Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                  ),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff2f2f2)),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)
              )
          ),
        )
    );
  }
}
