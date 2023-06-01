import 'package:flutter_test/flutter_test.dart';
import 'package:smart_text_search/smart_text_search/sort_by_similarity.dart';

class Pessoa {
  final String nome;
  Pessoa(this.nome);
}

void main() {

  test("orderBySimilarity Test", () {
    final pessoas = [
      Pessoa('Marcelo Meneses'),
      Pessoa('João da Silva'),
      Pessoa('Pedro da Silva'),
      Pessoa('Maria João'),
      Pessoa('João Paulo')
    ];

    const texto = 'João Silva';

    final pessoasOrdenadas = orderBySimilarity(
      texto,
      pessoas,
      (i, pessoa) => pessoa.nome
    );

    String result = pessoasOrdenadas.map((p) => p.nome).toString();
    expect(result, "(João da Silva, Maria João, João Paulo, Pedro da Silva, Marcelo Meneses)");
  }); 
  
  test("orderBySimilarity Test 1", () {
    final pessoas = [
      Pessoa('Marcelo Meneses'),
      Pessoa('João da Silva'),
      Pessoa('Pedro da Silva')
    ];

    const texto = 'João Silva';

    final pessoasOrdenadas = orderBySimilarity(
      texto,
      pessoas,
      (i, pessoa) => pessoa.nome
    );

    String result = pessoasOrdenadas.map((p) => p.nome).toString();
    expect(result, "(João da Silva, Pedro da Silva, Marcelo Meneses)");
  });
  
  test("orderBySimilarity Test 2", () {
    final pessoas = [
      Pessoa('Marcelo Meneses'),
      Pessoa('João da Silva'),
      Pessoa('Maria João'),
    ];

    const texto = 'João Silva';

    final pessoasOrdenadas = orderBySimilarity(
      texto,
      pessoas,
      (i, pessoa) => pessoa.nome
    );

    String result = pessoasOrdenadas.map((p) => p.nome).toString();
    expect(result, "(João da Silva, Maria João, Marcelo Meneses)");
  }); 

  test("orderBySimilarity Test 3", () {
    final pessoas = [
      Pessoa('João Paulo'),
      Pessoa('Marcelo Meneses'),
      Pessoa('João da Silva'),
    ];

    const texto = 'João Silva';

    final pessoasOrdenadas = orderBySimilarity(
      texto,
      pessoas,
      (i, pessoa) => pessoa.nome
    );

    String result = pessoasOrdenadas.map((p) => p.nome).toString();
    expect(result, "(João da Silva, João Paulo, Marcelo Meneses)");
  });  

  test("orderBySimilarity wrong word Test 4", () {
    final pessoas = [
      Pessoa('João Paulo'),
      Pessoa('Marcelo Meneses'),
      Pessoa('Joao da Silva'),
    ];

    const texto = 'João Silva';

    final pessoasOrdenadas = orderBySimilarity(
      texto,
      pessoas,
      (i, pessoa) => pessoa.nome
    );

    String result = pessoasOrdenadas.map((p) => p.nome).toString();
    expect(result, "(Joao da Silva, João Paulo, Marcelo Meneses)");
  }); 

  test("orderBySimilarity wrong word Test 4.1", () {
    final pessoas = [
      Pessoa('João Paulo'),
      Pessoa('Marcelo Meneses'),
      Pessoa('Joaoo da Silva'),
    ];

    const texto = 'João Silva';

    final pessoasOrdenadas = orderBySimilarity(
      texto,
      pessoas,
      (i, pessoa) => pessoa.nome
    );

    String result = pessoasOrdenadas.map((p) => p.nome).toString();
    expect(result, "(Joaoo da Silva, João Paulo, Marcelo Meneses)");
  }); 
  
  test("orderBySimilarity Test 5", () {
    final pessoas = [
      Pessoa('Marcelo Meneses'),
      Pessoa('João da Silva'),
      Pessoa('Pedro da Silva'),
      Pessoa('João Paulo')
    ];

    const texto = 'João da Silva';

    final pessoasOrdenadas = orderBySimilarity(
      texto,
      pessoas,
      (i, pessoa) => pessoa.nome
    );

    String result = pessoasOrdenadas.map((p) => p.nome).toString();
    expect(result, "(João da Silva, Pedro da Silva, João Paulo, Marcelo Meneses)");
  });
  
  test("orderBySimilarity wrong a search word Test 6", () {
    final pessoas = [
      Pessoa('Marcelo Meneses'),
      Pessoa('João da Silva'),
      Pessoa('Pedro da Silva'),
      Pessoa('João Paulo')
    ];

    const texto = 'Joao da Silva';

    final pessoasOrdenadas = orderBySimilarity(
      texto,
      pessoas,
      (i, pessoa) => pessoa.nome
    );

    String result = pessoasOrdenadas.map((p) => p.nome).toString();
    expect(result, "(João da Silva, Pedro da Silva, João Paulo, Marcelo Meneses)");
  });

  test("orderBySimilarity wrong two search word Test 6.1", () {
    final pessoas = [
      Pessoa('Marcelo Meneses'),
      Pessoa('João da Silva'),
      Pessoa('Pedro da Silva'),
      Pessoa('João Paulo')
    ];

    const texto = 'Joao da Slva';

    final pessoasOrdenadas = orderBySimilarity(
      texto,
      pessoas,
      (i, pessoa) => pessoa.nome
    );

    String result = pessoasOrdenadas.map((p) => p.nome).toString();
    expect(result, "(João da Silva, Pedro da Silva, João Paulo, Marcelo Meneses)");
  });
}
