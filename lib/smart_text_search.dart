import 'package:smart_text_search/smart_text_search/sort_by_similarity.dart';

class SmartTextSearch {
  static List<T> search<T>(
    String text,
    List<T> items,
    String Function(int index, T item) getString,
  ) {
    return orderBySimilarity(
      text,
      items,
      getString,
    );
  }
}
