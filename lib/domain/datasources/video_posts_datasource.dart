
import 'package:videos_tiktok_app/domain/entities/videos_post.dart';

abstract class VideoPostDatasource{

  Future<List<VideoPost>> getFavoriteVideosByUser( String userID );

  Future<List<VideoPost>> getTrendingVideosByPage( int page);

}