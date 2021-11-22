import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class Header extends StatefulWidget {
  final List<String>? imageLinks;
  final List<String>? videoLinks;

  static const DEFAULT_PREVIEW_PICTURE_LINK = 'assets/images/default_news.jpg';

  const Header({Key? key, this.imageLinks, this.videoLinks}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int _sliderIndex = 0;

  List<VideoPlayerController> _videoControllers = [];

  void setSliderIndex(int index) {
    _sliderIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> images = getImagesContainer(widget.imageLinks);
    List<Widget> videos = getVideoContainer(widget.videoLinks);
    List<Widget> slider = videos;
    slider.addAll(images);

    return Stack(
      children: [
        Container(
            height: 300,
            child: PageView(
              onPageChanged: (index) {
                _stopAllVideos();

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
                  ))),
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
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> getImagesContainer(List<String>? images) {
    List<Widget> imagesContainer = [];

    if (images != null && images.isNotEmpty) {
      images.forEach((image) {
        imagesContainer.add(Container(
            child: FadeInImage(
          fit: BoxFit.fill,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              Header.DEFAULT_PREVIEW_PICTURE_LINK,
              fit: BoxFit.fill,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(0.15),
            );
          },
          image: NetworkImage(image),
          placeholder: AssetImage(DEFAULT_WHITE_PICTURE_LINK),
        )));
      });
    } else {
      imagesContainer.add(Image.asset(
        Header.DEFAULT_PREVIEW_PICTURE_LINK,
        fit: BoxFit.fill,
        colorBlendMode: BlendMode.darken,
        color: Colors.black.withOpacity(0.15),
      ));
    }

    return imagesContainer;
  }

  List<Widget> getVideoContainer(List<String>? video) {
    List<Widget> videoContainer = [];

    if (video != null) {
      FlickManager flickManager;

      video.forEach((linkVideo) {
        VideoPlayerController _controller =
            VideoPlayerController.network(linkVideo);

        _videoControllers.add(_controller);

        flickManager = FlickManager(
          videoPlayerController: _controller,
          autoPlay: false,
        );

        videoContainer.add(Container(
          child: FlickVideoPlayer(
            flickManager: flickManager,
          ),
        ));
      });
    }

    return videoContainer;
  }

  @override
  void dispose() {
    _stopAllVideos();

    super.dispose();
  }

  void _stopAllVideos() {
    _videoControllers.forEach((_controller) {
      _controller.pause();
    });
  }
}
