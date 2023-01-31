import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_jr/app/ui/responsive.dart';

import '../../data/controllers/home_controller.dart';
import '../../data/models/person_model.dart';
import '../../ui/widgets/button_custom.dart';
import '../../ui/widgets/height_space.dart';
import '../../ui/widgets/input_form.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _formKey = GlobalKey<FormState>();
  var _nomeEC = TextEditingController();
  var _documentoEC = TextEditingController();
  var _dataNascimentoEC = TextEditingController();
  var _emailEC = TextEditingController();
  var _telefoneEC = TextEditingController();
  PessoaModel pessoa = Get.arguments['pessoa'];

  @override
  void initState() {
    _nomeEC = TextEditingController(text: pessoa.name);
    _documentoEC = TextEditingController(text: pessoa.document);
    _dataNascimentoEC = TextEditingController(text: pessoa.dtBirth);
    _emailEC = TextEditingController(text: pessoa.email);
    _telefoneEC = TextEditingController(text: pessoa.phone);
    super.initState();
  }

  @override
  void dispose() {
    _nomeEC.dispose();
    _documentoEC.dispose();
    _dataNascimentoEC.dispose();
    _emailEC.dispose();
    _telefoneEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Pessoa'),
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            var width = constraints.maxWidth;
            return Responsive(
              mobile: Center(
                child: FormEdit(
                  formKey: _formKey,
                  controller: controller,
                  nomeEC: _nomeEC,
                  width: width,
                  documentoEC: _documentoEC,
                  dataNascimentoEC: _dataNascimentoEC,
                  emailEC: _emailEC,
                  telefoneEC: _telefoneEC,
                  pessoa: pessoa,
                ),
              ),
              desktop: Center(
                child: SizedBox(
                  height: 600,
                  width: 400,
                  child: FormEdit(
                    formKey: _formKey,
                    controller: controller,
                    nomeEC: _nomeEC,
                    width: width,
                    documentoEC: _documentoEC,
                    dataNascimentoEC: _dataNascimentoEC,
                    emailEC: _emailEC,
                    telefoneEC: _telefoneEC,
                    pessoa: pessoa,
                  ),
                ),
              ),
              tablet: Center(
                child: SizedBox(
                  height: 600,
                  width: 400,
                  child: FormEdit(
                    formKey: _formKey,
                    controller: controller,
                    nomeEC: _nomeEC,
                    width: width,
                    documentoEC: _documentoEC,
                    dataNascimentoEC: _dataNascimentoEC,
                    emailEC: _emailEC,
                    telefoneEC: _telefoneEC,
                    pessoa: pessoa,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FormEdit extends StatelessWidget {
  const FormEdit({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.controller,
    required TextEditingController nomeEC,
    required this.width,
    required TextEditingController documentoEC,
    required TextEditingController dataNascimentoEC,
    required TextEditingController emailEC,
    required TextEditingController telefoneEC,
    required this.pessoa,
  })  : _formKey = formKey,
        _nomeEC = nomeEC,
        _documentoEC = documentoEC,
        _dataNascimentoEC = dataNascimentoEC,
        _emailEC = emailEC,
        _telefoneEC = telefoneEC,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final HomeController controller;
  final TextEditingController _nomeEC;
  final double width;
  final TextEditingController _documentoEC;
  final TextEditingController _dataNascimentoEC;
  final TextEditingController _emailEC;
  final TextEditingController _telefoneEC;
  final PessoaModel pessoa;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          HeightSpace(),
          InputForm(
            inputFormatters: [controller.maskName],
            controller: _nomeEC,
            width: width,
            label: 'Nome',
          ),
          HeightSpace(),
          InputForm(
            inputType: TextInputType.number,
            inputFormatters: [controller.maskCpf],
            controller: _documentoEC,
            width: width,
            label: 'CPF',
          ),
          HeightSpace(),
          InputForm(
            controller: _dataNascimentoEC,
            inputType: TextInputType.number,
            width: width,
            inputFormatters: [controller.maskDtBirth],
            label: 'Data de Nascimento',
          ),
          HeightSpace(),
          InputForm(
            controller: _emailEC,
            width: width,
            label: 'E-mail',
          ),
          HeightSpace(),
          InputForm(
            controller: _telefoneEC,
            inputFormatters: [controller.maskPhone],
            inputType: TextInputType.number,
            width: width,
            label: 'Telefone',
          ),
          HeightSpace(),
          ButtonCustom(
            onPressed: () {
              var personUpdate = PessoaModel(
                id: pessoa.id,
                name: _nomeEC.text,
                document: _documentoEC.text,
                dtBirth: _dataNascimentoEC.text,
                email: _emailEC.text,
                phone: _telefoneEC.text,
              );
              var formvalid = _formKey.currentState?.validate() ?? false;

              if (formvalid) {
                controller.updatePessoa(personUpdate);
                Get.back(
                  result: {'retorno': true},
                );
              }
            },
            width: width,
            label: 'Editar Pessoa',
          )
        ],
      ),
    );
  }
}
