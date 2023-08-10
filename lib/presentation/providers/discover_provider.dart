import 'package:flutter/material.dart';
import 'package:videos_tiktok_app/domain/entities/videos_post.dart';
import 'package:videos_tiktok_app/infrastructure/models/local_video_model.dart';
import 'package:videos_tiktok_app/shared/data/local_viodeo_post.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map(
          (video) => LocalVideoModel.fromJson(video).toVideoPostEntity(),
        )
        .toList();

    

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
