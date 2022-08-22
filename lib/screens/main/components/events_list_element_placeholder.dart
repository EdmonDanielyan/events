import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:shimmer/shimmer.dart';

class EventsListElementPlaceholder extends StatelessWidget {
  const EventsListElementPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              width: size.width,
              clipBehavior: Clip.hardEdge,
              height: SizeConfig(context, 170).getProportionateScreenHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.grey.withOpacity(0.2),
                child: Container(
                    height:
                        SizeConfig(context, 170).getProportionateScreenHeight,
                    color: Colors.black),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.5),
                    highlightColor: Colors.grey.withOpacity(0.2),
                    child: Container(
                      width: double.infinity,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 5),
              alignment: Alignment.topLeft,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.grey.withOpacity(0.2),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            )
          ],
        ));
  }
}
