import 'package:get/get_connect/connect.dart';

import '../models/person_model.dart';

class PersonRepository {
  final restClient = GetConnect();
  // Altere para o seu ip
  final String ip = '192.168.1.109';

  Future<List<PessoaModel>> findAll() async {
    final result = await restClient.get('http://$ip:8080/pessoas');

    if (result.hasError) {
      throw Exception('erro ao buscar usuário (${result.statusText})');
    }

    return result.body
        .map<PessoaModel>((person) => PessoaModel.fromMap(person))
        .toList();
  }

  Future<void> savePerson(PessoaModel person) async {
    final result =
        await restClient.post('http://$ip:8080/pessoas', person.toMap());

    if (result.hasError) {
      throw Exception('Erro ao salvar usuário (${result.statusText})');
    }
  }

  Future<void> deletePerson(PessoaModel person) async {
    final result =
        await restClient.delete('http://$ip:8080/pessoas/${person.id}');

    if (result.hasError) {
      throw Exception('Erro ao deletar usuário (${result.statusText})');
    }
  }

  Future<void> updatePerson(PessoaModel person) async {
    final result = await restClient.put(
        'http://$ip:8080/pessoas/${person.id}', person.toMap());

    if (result.hasError) {
      throw Exception('Erro ao atualizar usuário (${result.statusText})');
    }
  }
}
