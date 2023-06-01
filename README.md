# Smart Text Search

SmartTextSearch is a powerful search engine plugin designed to deliver efficient and accurate search capabilities similar to 'Google Search' and 'Elasticsearch'. Unlike traditional search engines, SmartTextSearch operates on your locally cached data, ensuring fast and secure searching. It features advanced typo tolerance and recognizes similar words for enhanced search results.

This package offers a highly efficient and accurate search solution that leverages two powerful algorithms. By analyzing text semantically and examining each word individually, it delivers superior search results with enhanced relevance. Experience the benefits of this package as it provides advanced techniques to ensure the most optimal correspondence between queries and search text.

## A Flutter package for Smart Text Search

![pub package][version_badge]

## Usage

```
import 'package:smart_text_search/smart_text_search/sort_by_similarity.dart';

//...

// your data
final people = [
  Person('Marcelo Meneses'),
  Person('John Doe'),
  Person('Peter Smith'),
  Person('Mary Jane'),
  Person('John Smith'),
  Person('João da Silva')
];

const textToSearch = 'John Smith';

final sortedPeople = orderBySimilarity(
  textToSearch,
  people,
  (index, person) => person.name
);

String result = sortedPeople.map((p) => p.name).toString();
// result: (John Smith, John Doe, Peter Smith, João da Silva, Mary Jane, Marcelo Meneses)
    
```
