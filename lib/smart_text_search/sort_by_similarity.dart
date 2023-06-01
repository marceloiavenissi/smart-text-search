import 'package:smart_text_search/smart_text_search/cos_similarity.dart';

/// Sorts a list of items by similarity to a given text.
List<T> orderBySimilarity<T>(
  String text,
  List<T> items,
  String Function(int index, T item) getString,
) {
  final Map<T, double> similarityMap = {};

  for (var i = 0; i < items.length; i++) {
    final item = items[i];
    final itemString = getString(i, item);
    final similarity = textCosineSimilarity(text, itemString);
    similarityMap[item] = similarity;
  }

  final sortedItems = items.toList()
    ..sort((a, b) => similarityMap[b]!.compareTo(similarityMap[a]!));

  return sortedItems;
}