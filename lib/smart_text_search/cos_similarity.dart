import 'dart:math';

/// Calculates the Levenshtein distance between two words.
int wordsLevenshteinDistance(String word1, String word2) {
  final m = word1.length + 1;
  final n = word2.length + 1;

  final matrix = List.generate(m, (_) => List<int>.filled(n, 0));

  for (var i = 0; i < m; i++) {
    matrix[i][0] = i;
  }

  for (var j = 0; j < n; j++) {
    matrix[0][j] = j;
  }

  for (var i = 1; i < m; i++) {
    for (var j = 1; j < n; j++) {
      final cost = word1[i - 1] == word2[j - 1] ? 0 : 1;
      matrix[i][j] = [
        matrix[i - 1][j] + 1,
        matrix[i][j - 1] + 1,
        matrix[i - 1][j - 1] + cost
      ].reduce(min);
    }
  }

  return matrix[m - 1][n - 1];
}

/// Calculates the cosine similarity between two texts.
double textCosineSimilarity(String text1, String text2) {
  // Separa as palavras em cada texto e as coloca em um conjunto para remover duplicatas
  final words1Set = text1.split(' ').toSet();
  final words2Set = text2.split(' ').toSet();
  final words1List = words1Set.toList();
  final words2List = words2Set.toList();

  // Cria um conjunto com todas as palavras dos dois textos
  final allWords = <String>{...words1Set, ...words2Set};

  // Calcula a similaridade entre cada par de palavras e armazena o resultado em uma matriz
  final matrix = _getWordsSimilarityMatrix(words1List, words2List);

  // Cria vetores para cada texto, onde cada posição representa a frequência de uma palavra
  final vector1 = _getVector(words1Set, allWords);
  final vector2 = _getVector(words2Set, allWords);
  vector1.updateAll((key, value) => value == 0? _getGratterSimilarity1(words2List.indexOf(key), matrix) : value);
  vector2.updateAll((key, value) => value == 0? _getGratterSimilarity2(words1List.indexOf(key), matrix) : value);

  // Calcula o numerador da similaridade angular por cosseno
  final dotProduct = _dotProduct(vector1, vector2, matrix, words1List);

  // Calcula o denominador da similaridade angular por cosseno
  final magnitude1 = _getMagnitude(vector1);
  final magnitude2 = _getMagnitude(vector2);
  final denominator = magnitude1 * magnitude2;

  // Calcula a similaridade angular por cosseno
  return dotProduct / denominator;
}

List<List<double>> _getWordsSimilarityMatrix(List<String> words1, List<String> words2){
  final matrix =  List<List<double>>.generate(
    words1.length, 
    (i) => List<double>.filled(words2.length, 0),
  );
  for (var i = 0; i < words1.length; i++) {
    final word1 = words1.elementAt(i);
    for (var j = 0; j < words2.length; j++) {
      final word2 = words2.elementAt(j);
      final distance = wordsLevenshteinDistance(word1, word2);
      matrix[i][j] = 1 / (distance + 1); // Adiciona 1 para evitar divisão por zero
    }
  }
  return matrix;
}

Map<String, double> _getVector(Set<String> words, Set<String> allWords) {
  final vectorAcc = <String, double>{};
  for (var word in allWords) {
    vectorAcc[word] = 0;
  }

  for (var word in words) {
    vectorAcc[word] = vectorAcc[word]! + 1;
  }
  return vectorAcc;

  /*final vector = <String, int>{};
  for (final word in allWords) {
    vector[word] = words.where((element) => word == element).length;
  }
  return vector;*/
}

double _dotProduct(
  Map<String, double> vector1, 
  Map<String, double> vector2, 
  List<List<double>> matrix, 
  List<String> words2,
) {
  return vector1.entries.fold<double>(
    0, 
    (acc, entry) => acc + (entry.value * (vector2[entry.key] ?? 0))
  );
  
  /*double dotProduct = 0;
  for (final key in vector1.keys) {
    dotProduct += vector1[key]! * (vector2[key] ?? 0) * matrix[allWordsList.indexOf(key)][allWordsList.indexOf(key)];
  }
  return dotProduct;*/
}

double _getGratterSimilarity1(int index, List<List<double>> matrix){
  double gratterSimilarity = matrix[0][index];
  for (var similarities in matrix) {
    if(similarities[index] > gratterSimilarity){
      gratterSimilarity = similarities[index];
    }
  }
  return gratterSimilarity;
}

double _getGratterSimilarity2(int index, List<List<double>> matrix){
  double gratterSimilarity = matrix[index][0];
  for (var similarity in matrix[index]) {
    if(similarity > gratterSimilarity){
      gratterSimilarity = similarity;
    }
  }
  return gratterSimilarity;
}

double _getMagnitude(Map<String, double> vector) {
  //sqrt(vector.values.fold(0, (acc, value) => acc + pow(value, 2)))
  double sum = 0;
  for (final value in vector.values) {
    sum += value * value;
  }
  return sqrt(sum.toDouble());
}