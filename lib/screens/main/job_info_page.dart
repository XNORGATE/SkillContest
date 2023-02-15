import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';

class JobInfoPage extends StatelessWidget {
  final Map<String, String> _jobs = {
    '警察': '抓人',
    '酒促': '陪酒',
    '學生': '讀書',
  };

  JobInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('職業資訊'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _jobs.length,
        itemBuilder: (BuildContext context, int index) {
          final jobTitle = _jobs.keys.elementAt(index);
          final jobContent = _jobs.values.elementAt(index);

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/job-info-detail',
                arguments: {'title': jobTitle, 'content': jobContent},
              );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    jobTitle,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
