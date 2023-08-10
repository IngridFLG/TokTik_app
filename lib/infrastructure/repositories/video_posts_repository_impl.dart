import 'package:videos_tiktok_app/domain/datasources/video_posts_datasource.dart';
import 'package:videos_tiktok_app/domain/entities/videos_post.dart';
import 'package:videos_tiktok_app/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements  VideoPostRepository{

  final VideoPostDatasource videoDatasource;

  VideoPostsRepositoryImpl({required this.videoDatasource});

  

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoDatasource.getTrendingVideosByPage(page);
  }

}