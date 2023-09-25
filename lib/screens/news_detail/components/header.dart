import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/components/video_player/video_player.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Header extends StatefulWidget {
  final List<String>? imageLinks;
  final List<String>? videoLinks;

  const Header({
    Key? key,
    this.imageLinks,
    this.videoLinks,
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  List<Widget> videoWidgets = [];
  List<BetterPlayerController> betterPlayerControllers = [];

  @override
  void initState() {
    super.initState();
    if (widget.videoLinks != null && widget.videoLinks!.isNotEmpty) {
      for (final link in widget.videoLinks!) {
        if (link.isNotEmpty && link.contains("mp4")) {
          if (mapCachedPlayerControllers.containsKey(link)) {
            betterPlayerControllers.add(mapCachedPlayerControllers[link]!);
            videoWidgets.add(CustomVideoPlayer(
                controller: mapCachedPlayerControllers[link]!));
          } else {
            BetterPlayerDataSource betterPlayerDataSource =
                BetterPlayerDataSource(
                    BetterPlayerDataSourceType.network, link);
            final _controller = BetterPlayerController(
              BetterPlayerConfiguration(
                deviceOrientationsAfterFullScreen: [
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp
                ],
                controlsConfiguration: BetterPlayerControlsConfiguration(
                  playerTheme: BetterPlayerTheme.material,
                  enableSkips: false,
                ),
                fit: BoxFit.contain,
              ),
              betterPlayerDataSource: betterPlayerDataSource,
            );
            betterPlayerControllers.add(_controller);
            videoWidgets.add(CustomVideoPlayer(controller: _controller));
          }
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
      mapCachedPlayerControllers.clear();
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
                alignment: AlignmentDirectional(0, 0.9),
                child: AnimatedSmoothIndicator(
                  activeIndex: _sliderIndex,
                  count: slider.length,
                  effect: ScrollingDotsEffect(
                    dotColor: Color(0xFFFFFFFF).withOpacity(0.5),
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

  List<Widget> getImagesContainer(List<String>? images) {
    List<Widget> imagesContainer = [];

    if (images != null && images.isNotEmpty) {
      images.forEach(
        (image) {
          imagesContainer.add(
            OptimizedCacheImage(
              imageUrl: image,
              placeholder: (context, _) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                    height:
                        SizeConfig(context, 270).getProportionateScreenHeight,
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
        },
      );
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
