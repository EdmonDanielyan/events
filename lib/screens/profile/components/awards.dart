import 'package:flutter/material.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/awards_item.dart';

import '../../../messenger/functions/size_config.dart';

class Awards extends StatelessWidget {
  final UserAwards? awards;
  const Awards({Key? key, required this.awards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (awards != null) {
      return getAwardsWidget(context);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget getAwardsWidget(context) {
    Size size = MediaQuery.of(context).size;

    List<Award> awardsList = this.getAwards();

    if (awardsList.isNotEmpty) {
      return Container(
          width: size.width,
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: SizeConfig(context, 90).getProportionateScreenHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade400, width: 0.5),
                      bottom:
                          BorderSide(color: Colors.grey.shade400, width: 0.5),
                    )),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: getAwards(),
                    ),
                  ),
                ),
              )
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }

  List<Award> getAwards() {
    List<Award> awardsList = [];

    if (awards!.goldenTanker) {
      awardsList.add(Award(award: AwardsItems.tanker));
    }

    if (awards!.goldenTanker2019) {
      awardsList.add(Award(award: AwardsItems.tanker));
    }

    if (awards!.team) {
      awardsList.add(Award(award: AwardsItems.greenLeaf));
    }

    return awardsList;
  }
}
