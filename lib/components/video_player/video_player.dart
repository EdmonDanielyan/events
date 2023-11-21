import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';


class CustomVideoPlayer extends StatefulWidget {
  // final BetterPlayerController controller;
    final ChewieController controller;
  const CustomVideoPlayer({Key? key, required this.controller})
      : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
     return Chewie(
      controller: widget.controller,
    );
    // return BetterPlayer(
    //   controller: widget.controller,
    // );
  }

  @override
  bool get wantKeepAlive => true;
}
