import 'package:videos_tiktok_app/domain/datasources/video_posts_datasource.dart';
import 'package:videos_tiktok_app/domain/entities/videos_post.dart';
import 'package:videos_tiktok_app/infrastructure/models/local_video_model.dart';
import 'package:videos_tiktok_app/shared/data/local_viodeo_post.dart';

class LocalVideoDatasource implements VideoPostDatasource{
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async{

    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map(
          (video) => LocalVideoModel.fromJson(video).toVideoPostEntity(),
        ).toList();

        return newVideos;
    
  }


}