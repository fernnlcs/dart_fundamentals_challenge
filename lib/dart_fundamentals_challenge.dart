void main() {
  //! Detalhe sobre a String
  //! A String é composta por 4 campos (Nome|Idade|Profissão|Estado onde mora)
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  //! Baseado no array acima monte um relatório onde:
  //! 1 - Apresente os pacientes com mais de 20 anos e print o nome deles
  //! 2 - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)
  //! 3 - Apresente a quantidade de pacientes que moram em SP

  final pacientesEmListas = pacientes.map((linha) => linha.split('|')).toList();

  print('> Questão 1: Imprima os nomes dos pacientes com mais de 20 anos');
  pacientesEmListas.where((listaDeDados) {
    final idade = int.tryParse(listaDeDados[1]);
    return idade != null && idade > 20;
  }).forEach((listaDeDados) => print(listaDeDados[0]));

  print('');
  print('> Questão 2: Apresente quantos pacientes existem para cada profissão');
  final profissoes = pacientesEmListas
      .map((listaDeDados) => listaDeDados[2].toLowerCase())
      .toSet()
      .toList();

  for (var profissao in profissoes) {
    final quantidadeDeProfissionais = pacientesEmListas
        .where((listaDeDados) => listaDeDados[2].toLowerCase() == profissao)
        .length;
    print('$profissao: $quantidadeDeProfissionais');
  }

  print('');
  print('> Questão 3: Apresente a quantidade de pacientes que moram em SP');
  final quantidadeDePaulistanos = pacientesEmListas
      .where((listaDeDados) => listaDeDados[3].toUpperCase() == 'SP')
      .length;
  print('$quantidadeDePaulistanos pacientes moram em SP');
}
