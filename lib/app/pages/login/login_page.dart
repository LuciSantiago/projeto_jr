import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_jr/app/ui/responsive.dart';

import '../../ui/widgets/button_custom.dart';
import '../../ui/widgets/height_space.dart';
import '../../ui/widgets/input_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;
        return Responsive(
          mobile: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff8BD9FF),
                      Color(0xffEAFDFF),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 196,
                      width: 192,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    HeightSpace(
                      height: 30,
                    ),
                    InputForm(
                      width: width,
                      label: 'E-mail',
                    ),
                    HeightSpace(),
                    InputForm(
                      senha: true,
                      width: width,
                      label: 'Senha',
                    ),
                    HeightSpace(),
                    ButtonCustom(
                      height: 45,
                      onPressed: () {
                        Get.offAllNamed('/home');
                      },
                      width: width,
                      label: 'Entrar',
                    ),
                  ],
                ),
              ),
            ),
          ),
          tablet: WebWidget(width: width, height: height),
          desktop: WebWidget(width: width, height: height),
        );
      },
    );
  }
}

class WebWidget extends StatelessWidget {
  const WebWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff8BD9FF),
                Color(0xffEAFDFF),
              ],
            ),
          ),
          child: Center(
            child: SizedBox(
              height: 600,
              width: 600,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Card(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 196,
                          width: 192,
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                        HeightSpace(
                          height: 30,
                        ),
                        InputForm(
                          width: constraints.maxWidth * 0.8,
                          label: 'E-mail',
                        ),
                        HeightSpace(),
                        InputForm(
                          senha: true,
                          width: constraints.maxWidth * 0.8,
                          label: 'Senha',
                        ),
                        HeightSpace(
                          height: 30,
                        ),
                        ButtonCustom(
                          height: 45,
                          onPressed: () {
                            Get.offAllNamed('/home');
                          },
                          width: constraints.maxWidth,
                          label: 'Entrar',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
