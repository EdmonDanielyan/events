import 'package:flutter/material.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/awards_item.dart';
import 'package:ink_mobile/screens/profile/components/section_title.dart';

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
      return Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: "Статусы",
            ),
            SizedBox(
              width: size.width,
              height: SizeConfig(context, 90).getProportionateScreenHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: awardsList.length,
                itemBuilder: (context, index) {
                  return awardsList[index];
                },
                separatorBuilder: (context, index) {
                  return index == getAwards().length - 1
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          width: 20.0,
                        );
                },
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
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
