import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:shimmer/shimmer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:transparent_image/transparent_image.dart';

class Header extends StatefulWidget {
  final List<String>? imageLinks;
  final List<String>? videoLinks;

  const Header({Key? key, this.imageLinks, this.videoLinks}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  List<Widget> videoWidgets = [];

  @override
  void initState() {
    super.initState();

    if (widget.videoLinks != null && widget.videoLinks!.isNotEmpty) {
      for (final link in widget.videoLinks!) {
        if (link.isNotEmpty) {
          final flManager = FlickManager(
            videoPlayerController: VideoPlayerController.network(link),
            autoPlay: false,
          );
          flickManager.add(flManager);
          videoWidgets.add(Container(
            child: FlickVideoPlayer(
              flickManager: flManager,
            ),
          ));
        }
      }
    }
  }

  @override
  void dispose() {
    _stopAllVideos();

    super.dispose();
  }

  void _stopAllVideos() {
    if (flickManager.isNotEmpty) {
      for (final video in flickManager) {
        video.dispose();
      }
    }
  }

  int _sliderIndex = 0;

  List<FlickManager> flickManager = [];

  void setSliderIndex(int index) {
    _sliderIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> images = getImagesContainer(widget.imageLinks);
    List<Widget> slider = videoWidgets;
    slider.addAll(images);

    return Stack(
      children: [
        Container(
            height: 300,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  setSliderIndex(index);
                });
              },
              scrollDirection: Axis.horizontal,
              children: slider,
            )),
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
                    activeDotColor: Colors.white),
              ),
            ),
          ),
        ],
        Positioned.fill(
            child: Align(
                alignment: AlignmentDirectional(-1.1, -0.7),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    IconLinks.CLOSE_BUTTON_SVG_LINK,
                    width: 40,
                    height: 40,
                  ),
                ))),
      ],
    );
  }

  List<Widget> getImagesContainer(List<String>? images) {
    List<Widget> imagesContainer = [];

    if (images != null && images.isNotEmpty) {
      images.forEach((image) {
        imagesContainer.add(Stack(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.withOpacity(0.2),
              child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black),
            ),
            FadeInImage.memoryNetwork(
                height: 300,
                fit: BoxFit.fill,
                fadeInDuration: Duration(milliseconds: 300),
                placeholder: kTransparentImage,
                image: image,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    DEFAULT_PREVIEW_PICTURE_LINK,
                    fit: BoxFit.fill,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black.withOpacity(0.15),
                  );
                }),
          ],
        ));
      });
    } else {
      imagesContainer.add(Image.asset(
        DEFAULT_PREVIEW_PICTURE_LINK,
        fit: BoxFit.fill,
        colorBlendMode: BlendMode.darken,
        color: Colors.black.withOpacity(0.15),
      ));
    }

    return imagesContainer;
  }
}
