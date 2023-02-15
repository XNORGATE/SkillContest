import 'package:flutter/material.dart';

class SkillContestInfoDetailPage extends StatelessWidget {
  const SkillContestInfoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = args['title'];
    final content = args['content'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 24.0)),
            const SizedBox(height: 16.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
