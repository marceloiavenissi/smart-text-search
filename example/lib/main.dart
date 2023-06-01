import 'package:flutter/material.dart';
import 'package:smart_text_search/smart_text_search/sort_by_similarity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _searchTextController = TextEditingController();

  final List<String> items = [
    'Apple',
    'Banana',
    'Orange',
    'Strawberry',
    'Grapes',
    'Watermelon',
    'Mango',
    'Pineapple',
    'Kiwi',
    'Peach',
    'Pear',
    'Cherry',
    'Blueberry',
    'Raspberry',
    'Lemon',
    'Lime',
    'Avocado',
    'Coconut',
    'Pomegranate',
    'Blackberry',
    'Cantaloupe',
    'Mandarin',
    'Papaya',
    'Apricot',
    'Guava',
    'Passion Fruit',
    'Plum',
    'Fig',
    'Lychee',
    'Cranberry',
    'Dragon Fruit',
    'Kiwifruit',
    'Star Fruit',
    'Persimmon',
    'Nectarine',
    'Tangerine',
    'Grapefruit',
    'Jackfruit',
    'Mulberry',
    'Pawpaw',
    'Quince',
    'Clementine',
    'Honeydew',
    'Blackcurrant',
    'Elderberry',
    'Date',
    'Rambutan',
    'Soursop',
    'Carambola',
    'Cactus Fruit'
  ];

  List<String> listToView = [];

  @override
  void initState() {
    super.initState();
    listToView = items;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          children: [
            TextField(
              controller: _searchTextController,
            ),
            IconButton(
              onPressed: _onSearch, 
              icon: const Icon(Icons.search),
            ),
            ...listToView.map<Widget>(
              (e) => ListTile(
                title: Text(e),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onSearch(){
    List<String> searchResults = orderBySimilarity(
      _searchTextController.text, 
      items, 
      (index, item) => item
    );
    setState(() {
      listToView = searchResults;
    });
  }
}
