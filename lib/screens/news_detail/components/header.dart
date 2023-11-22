import 'package:chewie/chewie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/components/video_player/video_player.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

// TODO: этот List<String?>? очень плохо выглядит
// перед релизом в этом файле обработать все !
// чтобы не забыть:
//в идеале привести это к List<String>?, для этого копать в models/news_data и extensions/get_news_by_id
// Проблема в том что в генераторе тип BuitList<String?>, из-за этого не получается привести к List<String>?
// Идея: накатить CustomBuilder как в core/builder, но пока непонятно как это сделать, в т.ч. из-за сгенеренной апи
// но в кажется нужно туда копать и решение найдется
//
class Header extends StatefulWidget {
  final List<String?>? imageLinks;
  final List<String?>? videoLinks;

  const Header({Key? key, this.imageLinks, this.videoLinks}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  List<Widget> videoWidgets = [];
  // List<BetterPlayerController> betterPlayerControllers = [];
  List<ChewieController> betterPlayerControllers = [];

  @override
  void initState() {
    super.initState();

    if (widget.videoLinks != null && widget.videoLinks!.isNotEmpty) {
      for (final link in widget.videoLinks!) {
        // if (link.isNotEmpty && link.contains("mp4")) {
        //   BetterPlayerDataSource betterPlayerDataSource =
        //       BetterPlayerDataSource(BetterPlayerDataSourceType.network, link);
        //   final _controller = BetterPlayerController(
        //     BetterPlayerConfiguration(
        //       controlsConfiguration: BetterPlayerControlsConfiguration(
        //         playerTheme: BetterPlayerTheme.material,
        //         enableSkips: false,
        //       ),
        //       fit: BoxFit.contain,
        //     ),
        //     betterPlayerDataSource: betterPlayerDataSource,
        //   );
        //   betterPlayerControllers.add(_controller);
        //   videoWidgets.add(
        //     CustomVideoPlayer(controller: _controller),
        //   );
        if (link!.isNotEmpty && link.contains("mp4")) {
          final videoPlayerController =
              VideoPlayerController.networkUrl(Uri.parse(link));
          // BetterPlayerDataSource betterPlayerDataSource =
          //     BetterPlayerDataSource(BetterPlayerDataSourceType.network, link);
          final _controller =
              ChewieController(videoPlayerController: videoPlayerController

                  // BetterPlayerConfiguration(
                  //   controlsConfiguration: BetterPlayerControlsConfiguration(
                  //     playerTheme: BetterPlayerTheme.material,
                  //     enableSkips: false,
                  //   ),
                  //   fit: BoxFit.contain,
                  // ),
                  // betterPlayerDataSource: betterPlayerDataSource,
                  );
          betterPlayerControllers.add(_controller);
          videoWidgets.add(
            CustomVideoPlayer(controller: _controller),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _disposeAllVideos();

    super.dispose();
  }

  void _disposeAllVideos() {
    if (betterPlayerControllers.isNotEmpty) {
      for (final video in betterPlayerControllers) {
        video.dispose();
      }
    }
  }

  void _stopAllVideos() {
    if (betterPlayerControllers.isNotEmpty) {
      for (final video in betterPlayerControllers) {
        video.pause();
      }
    }
  }

  int _sliderIndex = 0;

  void setSliderIndex(int index) {
    _sliderIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> slider = List<Widget>.from(videoWidgets)
      ..addAll(getImagesContainer(widget.imageLinks))
      ..toSet();

    return SizedBox(
      height: SizeConfig(context, 270).getProportionateScreenHeight,
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  setSliderIndex(index);
                });
                _stopAllVideos();
              },
              scrollDirection: Axis.horizontal,
              children: slider,
            ),
          ),
          if (slider.length > 1) ...[
            Positioned.fill(
              child: Align(
                alignment: const AlignmentDirectional(0, 0.9),
                child: AnimatedSmoothIndicator(
                  activeIndex: _sliderIndex,
                  count: slider.length,
                  effect: ScrollingDotsEffect(
                    dotColor: const Color(0xFFFFFFFF).withOpacity(0.5),
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  List<Widget> getImagesContainer(List<String?>? images) {
    List<Widget> imagesContainer = [];

    if (images != null && images.isNotEmpty) {
      for (var image in images) {
        imagesContainer.add(
          CachedNetworkImage(
            imageUrl: image!,
            placeholder: (context, _) {
              return Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey.withOpacity(0.2),
                child: Container(
                  height: SizeConfig(context, 270).getProportionateScreenHeight,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
              );
            },
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            errorWidget: (context, _, __) {
              return Image.asset(
                DEFAULT_PREVIEW_PICTURE_LINK,
                fit: BoxFit.fitWidth,
                colorBlendMode: BlendMode.darken,
                color: Colors.black.withOpacity(0.15),
              );
            },
          ),
        );
      }
    } else {
      imagesContainer.add(
        Image.asset(
          DEFAULT_PREVIEW_PICTURE_LINK,
          fit: BoxFit.fill,
          colorBlendMode: BlendMode.darken,
          color: Colors.black.withOpacity(0.15),
        ),
      );
    }

    return imagesContainer;
  }
}
