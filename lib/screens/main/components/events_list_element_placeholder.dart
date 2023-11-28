import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/screens/main/components/placeholder_constructor.dart';
import 'package:shimmer/shimmer.dart';

class EventsListElementPlaceholder extends StatelessWidget {
  const EventsListElementPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: SizeConfig(context, 180.0).getProportionateScreenHeight,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.grey.withOpacity(0.2),
              child: Container(
                  height: SizeConfig(context, 170).getProportionateScreenHeight,
                  color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const PlaceHolderConstructor(height: 20, width: double.infinity),
        const SizedBox(height: 8),
        const PlaceHolderConstructor(height: 60, width: double.infinity),
        const SizedBox(height: 12),
        //TODO: сделать когда будет несколько событий
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Material(
        //     color: Colors.transparent,
        //     child: InkWell(
        //       borderRadius: BorderRadius.circular(25),
        //       onTap: () {
        //         // Share.share(
        //         //     'https://portal.irkutskoil.ru/events/${event.id}/');
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
        //         child: Row(
        //           mainAxisSize: MainAxisSize.min,
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             Text(
        //               'Поделиться',
        //               style:
        //                   FontStyles.rubikP1Medium(color: Palette.greenE4A),
        //             ),
        //             const SizedBox(width: 8),
        //             Icon(Icons.share, size: 16, color: Palette.greenE4A),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
