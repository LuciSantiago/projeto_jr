import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_jr/app/data/controllers/home_controller.dart';
import 'package:projeto_jr/app/data/models/person_model.dart';
import 'package:projeto_jr/app/ui/responsive.dart';
import 'package:projeto_jr/app/ui/widgets/button_custom.dart';
import 'package:projeto_jr/app/ui/widgets/input_form.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pessoas'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.refreshPessoa();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed('/register');
              },
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Responsive(
            mobile: controller.obx(
              (state) {
                if (state == null) {
                  return const Center(
                    child: Text('Nenhuma pessoa cadastrada'),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18.0,
                      horizontal: 8,
                    ),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Form(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InputForm(
                                    controller: controller.buscaEC,
                                    isBorder: false,
                                    width: 250,
                                    label: 'Pesquisar Pessoa',
                                  ),
                                  IconButton(
                                    color: const Color(0xff266386),
                                    iconSize: 30,
                                    onPressed: () {
                                      controller
                                          .searchById(controller.buscaEC.text);
                                    },
                                    icon: const Icon(Icons.search),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            childCount: state.length,
                            (context, index) {
                              final pessoa = state[index];
                              return Card(
                                elevation: 3,
                                child: ListTile(
                                  title: Text(
                                    pessoa.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Text(pessoa.phone),
                                  trailing: SizedBox(
                                    width: 150,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            dialogInform(true, pessoa);
                                          },
                                          icon: const Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 30,
                                            color: Color(0xff266386),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Get.toNamed('/update',
                                                arguments: {'pessoa': pessoa});
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 30,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            dialogDelete(controller, pessoa);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisExtent: 80,
                            mainAxisSpacing: 10,
                          ),
                        )
                      ],
                    ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.vertical,
                  );
                }
              },
              onEmpty: const Center(
                child: Text(
                  'Nenhuma pessoa cadastrada',
                ),
              ),
              onError: (error) => const Center(
                child: Text('Erro ao buscar pessoas'),
              ),
            ),
            tablet:
                WebWidgets(controller: controller, buscaEC: controller.buscaEC),
            desktop:
                WebWidgets(controller: controller, buscaEC: controller.buscaEC),
          );
        },
      ),
    );
  }
}

class WebWidgets extends StatelessWidget {
  const WebWidgets({
    Key? key,
    required this.controller,
    required TextEditingController buscaEC,
  })  : _buscaEC = buscaEC,
        super(key: key);

  final HomeController controller;
  final TextEditingController _buscaEC;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: controller.obx(
        (state) {
          if (state == null) {
            return const Center(
              child: Text('Nenhuma pessoa cadastrada'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
                horizontal: 8,
              ),
              child: Center(
                child: SizedBox(
                  width: 800,
                  height: 800,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          child: Form(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InputForm(
                                  controller: _buscaEC,
                                  isBorder: false,
                                  width: 400,
                                  label: 'Pesquisar Pessoa',
                                ),
                                IconButton(
                                  color: const Color(0xff266386),
                                  iconSize: 30,
                                  onPressed: () {
                                    controller.searchById(_buscaEC.text);
                                  },
                                  icon: const Icon(Icons.search),
                                ),
                                const Expanded(child: SizedBox.shrink()),
                                ButtonCustom(
                                  width: 300,
                                  label: 'Cadastrar',
                                  onPressed: () {
                                    Get.toNamed('/register');
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.length,
                          (context, index) {
                            final pessoa = state[index];
                            return Card(
                              elevation: 3,
                              child: ListTile(
                                title: Text(
                                  pessoa.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Text(pessoa.phone),
                                trailing: SizedBox(
                                  width: 150,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          dialogInform(false, pessoa);
                                        },
                                        icon: const Icon(
                                          Icons.remove_red_eye_outlined,
                                          size: 30,
                                          color: Color(0xff266386),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          var retorno = await Get.toNamed(
                                              '/update',
                                              arguments: {'pessoa': pessoa});

                                          if (retorno['retorno']) {
                                            controller.refreshPessoa();
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          size: 30,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          dialogDelete(controller, pessoa);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 80,
                          mainAxisSpacing: 10,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.vertical,
            );
          }
        },
        onEmpty: const Center(
          child: Text(
            'Nenhuma pessoa cadastrada',
          ),
        ),
        onError: (error) => const Center(
          child: Text('Erro ao buscar pessoas'),
        ),
      ),
    );
  }
}

Future<dynamic> dialogInform(bool isMobile, PessoaModel pessoa) {
  return Get.defaultDialog(
      title: 'Informações',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      confirm: ButtonCustom(
        width: 130,
        label: 'OK',
        onPressed: () {
          Get.back();
        },
      ),
      content: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Nome: ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 18 : 22,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: pessoa.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'E-mail: ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 18 : 22,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: pessoa.email,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'CPF: ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 18 : 22,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: pessoa.document,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Data de Nascimento: ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 18 : 22,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: pessoa.dtBirth,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Telefone: ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 18 : 22,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: pessoa.phone,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            //Text(pessoa.name),
          ],
        ),
      ));
}

Future<dynamic> dialogDelete(HomeController controller, PessoaModel pessoa) {
  return Get.defaultDialog(
    title: 'Atenção!',
    content: Text('Deseja excluir ${pessoa.name}?'),
    cancel: ButtonCustom(
      width: 220,
      label: 'Cancelar',
      color: Colors.red,
      onPressed: () {
        Get.back();
      },
    ),
    confirm: ButtonCustom(
      width: 200,
      label: 'Excluir',
      color: Colors.green,
      onPressed: () {
        controller.deletePessoa(pessoa);
        Get.back();
      },
    ),
  );
}
