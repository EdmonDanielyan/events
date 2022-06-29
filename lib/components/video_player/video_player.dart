import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class CustomVideoPlayer extends StatefulWidget {
  final BetterPlayerController controller;
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
    return BetterPlayer(
      controller: widget.controller,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
