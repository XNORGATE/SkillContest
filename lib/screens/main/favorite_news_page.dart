import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteNewsPage extends StatefulWidget {
  const FavoriteNewsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteNewsPageState createState() => _FavoriteNewsPageState();
}

class _FavoriteNewsPageState extends State<FavoriteNewsPage> {
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
      print('Loaded Favorites: $_favorites');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite News'),
      ),
      body: _buildFavoritesList(),
    );
  }

  Widget _buildFavoritesList() {
    return ListView.builder(
      itemCount: _favorites.length,
      itemBuilder: (BuildContext context, int index) {
        final newsTitle = _favorites[index];
        return Dismissible(
          key: Key(newsTitle),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            setState(() {
              _favorites.removeAt(index);
              prefs.setStringList('favorites', _favorites);
            });
          },
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/news-detail',
                arguments: newsTitle,
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
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
