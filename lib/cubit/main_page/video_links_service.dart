import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/cubit/news_detail/sources/fetch/network.dart';
import 'package:ink_mobile/extensions/get_news_by_id.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/setup.dart';

abstract class IVideoLinksService {
  Map<String, BetterPlayerController> get mapLinks;
  set mapLinks(Map<String, BetterPlayerController> value);
  void addToMap(String key, BetterPlayerController value);
  void removeFromMap(String key);
  Future<void> fetchVideoLinks(List<NewsItemData> listNews);
}

class VideoLinksService implements IVideoLinksService {
  Set<String> oldLinks = {};
  Map<String, BetterPlayerController> _mapLinks = {};

  @override
  Map<String, BetterPlayerController> get mapLinks {
    return _mapLinks;
  }

  @override
  set mapLinks(Map<String, BetterPlayerController> value) {
    _mapLinks = value;
  }

  @override
  void addToMap(String key, BetterPlayerController value) {
    _mapLinks[key] = value;
  }

  @override
  void removeFromMap(String key) {
    _mapLinks.remove(key);
  }

  @override
  Future<void> fetchVideoLinks(List<NewsItemData> listNews) async {
    for (var item in listNews) {
      final responseItemData =
          await getIt<NewsDetailNetworkRequest>(param1: item.id)();
      final responseItemVideoLinks = responseItemData.mapResponse().videoLinks;
      if (responseItemVideoLinks != null) {
        if (responseItemVideoLinks.isNotEmpty) {
          if (mapLinks.containsKey(responseItemVideoLinks.first) ||
              oldLinks.contains(responseItemVideoLinks.first)) {
          } else {
            BetterPlayerDataSource dataSource = BetterPlayerDataSource(
                BetterPlayerDataSourceType.network,
                responseItemVideoLinks.first,
                cacheConfiguration: BetterPlayerCacheConfiguration(
                    useCache: true,
                    maxCacheFileSize: 7 * 1024 * 1024,
                    maxCacheSize: 7 * 1024 * 1024,
                    preCacheSize: 3 * 1024 * 1024),
                bufferingConfiguration: BetterPlayerBufferingConfiguration(
                  minBufferMs: 10000,
                  maxBufferMs: 20000,
                ));
            BetterPlayerController _controller = BetterPlayerController(
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
                betterPlayerDataSource: dataSource);
            if (mapLinks.length >= 2) {
              mapLinks.remove(mapLinks.keys.first);
              addToMap('${responseItemVideoLinks.first}', _controller);
              oldLinks.add('${responseItemVideoLinks.first}');
            } else {
              addToMap('${responseItemVideoLinks.first}', _controller);
              oldLinks.add('${responseItemVideoLinks.first}');
            }
          }
        }
      }
    }
  }
}
