import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videos_tiktok_app/config/theme/app_theme.dart';
import 'package:videos_tiktok_app/presentation/providers/discover_provider.dart';
import 'package:videos_tiktok_app/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //operador de cascada .. 
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage()),
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