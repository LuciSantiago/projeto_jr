import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_jr/app/data/models/person_model.dart';

import '../repository/person_repository.dart';

class HomeController extends GetxController with StateMixin<List<PessoaModel>> {
  final PersonRepository _repository;
  final buscaEC = TextEditingController();

  HomeController({
    required PersonRepository repository,
  }) : _repository = repository;

  var listaPessoas = <PessoaModel>[];

  var maskPhone = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    //type: MaskAutoCompletionType.lazy,
  );

  var maskCpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    //type: MaskAutoCompletionType.lazy,
  );

  var maskDtBirth = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    //type: MaskAutoCompletionType.lazy,
  );

  var maskName = MaskTextInputFormatter(
    mask: '#' * 80,
    filter: {"#": RegExp(r'(^[a-z A-Z ]*$)')},
    //type: MaskAutoCompletionType.lazy,
  );

  @override
  void onReady() {
    _findAll();
    super.onReady();
  }

  @override
  void onClose() {
    buscaEC.dispose();
    super.onClose();
  }

  void _findAll() async {
    try {
      change([], status: RxStatus.loading());

      final person = await _repository.findAll();
      await 1.seconds.delay();
      var statusReturn = RxStatus.success();

      if (person.isEmpty) {
        statusReturn = RxStatus.empty();
      }

      change(person, status: statusReturn);
    } on Exception catch (e, s) {
      log('Erro ao buscar usuários', error: e, stackTrace: s);
      change(state, status: RxStatus.error());
    }
  }

  Future<void> register(PessoaModel person) async {
    await _repository.savePerson(person);
    _findAll();
    Get.snackbar(
      'Sucesso',
      'Pessoa cadastrada com sucesso',
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 0,
    );
  }

  Future<void> updatePessoa(PessoaModel pessoa) async {
    await _repository.updatePerson(pessoa);

    _findAll();
    Get.snackbar(
      'Sucesso',
      'Pessoa editada com sucesso',
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 0,
    );
  }

  Future<void> deletePessoa(PessoaModel pessoa) async {
    await _repository.deletePerson(pessoa);
    _findAll();
    Get.snackbar(
      'Sucesso',
      'Pessoa deletado com sucesso',
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 0,
    );
  }

  void refreshPessoa() async {
    _findAll();
  }

  Future<void> searchById(String value) async {
    final person = await _repository.findAll();
    var statusReturn = RxStatus.success();
    var personBusca = <PessoaModel>[].obs;
    var pessoa = person;
    for (var element in pessoa) {
      if (element.name.isCaseInsensitiveContains(value)) {
        personBusca.add(element);
      }
    }
    change([], status: RxStatus.loading());
    await 1.seconds.delay();
    if (personBusca.isEmpty) {
      change(state, status: RxStatus.error());
      await 1.seconds.delay();
      _findAll();
    } else {
      change(personBusca, status: statusReturn);
    }
  }
}
