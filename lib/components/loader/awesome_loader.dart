import 'package:flutter/material.dart';

class AwesomeLoader extends StatefulWidget {
  final Color color;

  const AwesomeLoader({Key? key, required this.color}) : super(key: key);

  @override
  State<AwesomeLoader> createState() => _AwesomeLoaderState();
}

class _AwesomeLoaderState extends State<AwesomeLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lengthAnimation;
  late Animation<double> _lengthAnimation1;
  late Animation<double> _offsetAnimation;
  double _length = 10.0;
  double offset1 = 30.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 1, milliseconds: 500));

    _lengthAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.75, curve: Curves.easeOut)));
    _lengthAnimation1 = Tween<double>(begin: 10.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));

    _offsetAnimation = Tween<double>(begin: 30.0, end: 50.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.25, 1.0, curve: Curves.easeIn)));

    _controller.addListener(() {
      setState(() {
        offset1 = _offsetAnimation.value;
        if (_controller.value < 0.75) {
          _length = _lengthAnimation.value;
        } else {
          _length = _lengthAnimation1.value;
        }
      });
    });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: const Alignment(0.0, 0.0),
        children: <Widget>[
          Positioned(
            top: offset1,
            child: Line(
              width: 5,
              height: _length,
              color: widget.color,
            ),
          ),
          Positioned(
            bottom: offset1,
            child: Line(
              width: 5,
              height: _length,
              color: widget.color,
            ),
          ),
          Positioned(
            left: offset1,
            child: Line(
              width: _length,
              height: 5,
              color: widget.color,
            ),
          ),
          Positioned(
            right: offset1,
            child: Line(
              width: _length,
              height: 5,
              color: widget.color,
            ),
          )
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const Line(
      {Key? key,
      required this.width,
      required this.height,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ));
  }
}
