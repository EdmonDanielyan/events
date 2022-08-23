import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class AppBarBackBtn extends StatelessWidget {
  final void Function()? onPressed;
  const AppBarBackBtn({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: SizeConfig(context, 19).getProportionateScreenHeight,
      ),
      onPressed:
          onPressed ?? () async => await Navigator.of(context).maybePop(),
    );
  }
}
