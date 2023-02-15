import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LatestNewsPage extends StatefulWidget {
  const LatestNewsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LatestNewsPageState createState() => _LatestNewsPageState();
}

class _LatestNewsPageState extends State<LatestNewsPage> {
  final Map<String, String> _latestNews = {
    'News 1': 'News 1 Info',
    'News 2': 'News 2 Info',
    'News 3': 'News 3 Info',
    'News 4': 'News 4 Info',
    'News 5': 'News 5 Info',
  };

  List<String> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favorites = prefs.getStringList('favorites') ?? [];
    });
  }

  void _toggleFavorite(String newsTitle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_favorites.contains(newsTitle)) {
        _favorites.remove(newsTitle);
      } else {
        _favorites.add(newsTitle);
      }
      prefs.setStringList('favorites', _favorites);
      print('Favorites: $_favorites');
    });
  }

  bool _isFavorite(String newsTitle) {
    return _favorites.contains(newsTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('最新消息'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/favorite-news',
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _latestNews.length,
        itemBuilder: (BuildContext context, int index) {
          final newsTitle = _latestNews.keys.elementAt(index);
          final newsInfo = _latestNews.values.elementAt(index);

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/news-detail',
                arguments: {'title': newsTitle, 'content': newsInfo},
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        newsTitle,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _isFavorite(newsTitle)
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                      onPressed: () {
                        _toggleFavorite(newsTitle);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
