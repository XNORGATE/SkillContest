import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';

class SkillContestInfoPage extends StatefulWidget {
  const SkillContestInfoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SkillContestInfoPageState createState() => _SkillContestInfoPageState();
}

class _SkillContestInfoPageState extends State<SkillContestInfoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('技能競賽資訊'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '評分'),
            Tab(text: '獎品'),
            Tab(text: '規則'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabContent('評分', '這裡是評分資訊'),
          _buildTabContent('獎品', '這裡是獎品'),
          _buildTabContent('規則', '規則在這裡'),
        ],
      ),
    );
  }

  Widget _buildTabContent(String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 24.0)),
            const SizedBox(height: 16.0),
            Text(content),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, '/skill-contest-info-detail',
              arguments: {'title': title, 'content': content});
        },
      ),
    );
  }
}
