import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_jr/app/data/models/person_model.dart';
import 'package:projeto_jr/app/ui/responsive.dart';
import 'package:projeto_jr/app/ui/widgets/button_custom.dart';
import 'package:projeto_jr/app/ui/widgets/height_space.dart';
import 'package:projeto_jr/app/ui/widgets/input_form.dart';

import '../../data/controllers/home_controller.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  //var controller = HomeController();
  final _formKey = GlobalKey<FormState>();
  final _nomeEC = TextEditingController();
  final _documentoEC = TextEditingController();
  final _dataNascimentoEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _telefoneEC = TextEditingController();

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
        title: const Text('Cadastrar Pesssoa'),
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            var width = constraints.maxWidth;
            return Responsive(
              mobile: Center(
                child: Form(
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
                          var person = PessoaModel(
                            name: _nomeEC.text,
                            document: _documentoEC.text,
                            dtBirth: _dataNascimentoEC.text,
                            email: _emailEC.text,
                            phone: _telefoneEC.text,
                          );
                          var formvalid =
                              _formKey.currentState?.validate() ?? false;

                          if (formvalid) {
                            controller.register(person);
                            Get.back();
                          }
                        },
                        width: width,
                        label: 'Cadastrar',
                      )
                    ],
                  ),
                ),
              ),
              tablet: WebWidget(
                formKey: _formKey,
                controller: controller,
                nomeEC: _nomeEC,
                width: width,
                documentoEC: _documentoEC,
                dataNascimentoEC: _dataNascimentoEC,
                emailEC: _emailEC,
                telefoneEC: _telefoneEC,
              ),
              desktop: WebWidget(
                formKey: _formKey,
                controller: controller,
                nomeEC: _nomeEC,
                width: width,
                documentoEC: _documentoEC,
                dataNascimentoEC: _dataNascimentoEC,
                emailEC: _emailEC,
                telefoneEC: _telefoneEC,
              ),
            );
          },
        ),
      ),
    );
  }
}

class WebWidget extends StatelessWidget {
  const WebWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.controller,
    required TextEditingController nomeEC,
    required this.width,
    required TextEditingController documentoEC,
    required TextEditingController dataNascimentoEC,
    required TextEditingController emailEC,
    required TextEditingController telefoneEC,
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 600,
        width: 400,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  var person = PessoaModel(
                    name: _nomeEC.text,
                    document: _documentoEC.text,
                    dtBirth: _dataNascimentoEC.text,
                    email: _emailEC.text,
                    phone: _telefoneEC.text,
                  );
                  var formvalid = _formKey.currentState?.validate() ?? false;

                  if (formvalid) {
                    controller.register(person);
                    Get.back();
                  }
                },
                width: width,
                label: 'Cadastrar',
              )
            ],
          ),
        ),
      ),
    );
  }
}
