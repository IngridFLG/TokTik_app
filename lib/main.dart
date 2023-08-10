import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videos_tiktok_app/config/theme/app_theme.dart';
import 'package:videos_tiktok_app/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:videos_tiktok_app/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:videos_tiktok_app/presentation/providers/discover_provider.dart';
import 'package:videos_tiktok_app/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //si se necesita cambiar por otros videos ej: que no sean locales, solo se cambia el datasource
    final videoPostsRepository = VideoPostsRepositoryImpl(videoDatasource: LocalVideoDatasource());
    return MultiProvider(
      providers: [
        //operador de cascada .. 
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoRepository: videoPostsRepository)..loadNextPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TokTik',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}