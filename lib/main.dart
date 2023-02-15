// import 'package:flutter/material.dart';
import 'screens/main/home_page.dart';
import './screens/main/skill_contest_info_page.dart';
import 'screens/detail/latest_news_detail_page.dart';
import 'screens/detail/skill_contest_detail_info_page.dart';
import 'screens/main/job_info_page.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:flutter/services.dart';
import 'screens/main/favorite_news_page.dart';
import 'screens/detail/job_detail_info_page.dart';
import './screens/main/latest_news_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: '技能競賽APP Beta v1.0',
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: const NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/latest_news': (context) => const LatestNewsPage(),
        '/skill_contest_info': (context) => const SkillContestInfoPage(),
        '/job_info': (context) => JobInfoPage(),
/////////////////////////////////////////////////////////// for more info
        '/news-detail': (context) => const NewsDetailPage(),
        '/skill-contest-info-detail': (context) =>
            const SkillContestInfoDetailPage(),
        '/job-info-detail': (context) => const JobInfoDetailPage(),
////////////////////////////////////////////////// favor
        '/favorite-news': (context) => const FavoriteNewsPage(),
      },
    );
  }
}
