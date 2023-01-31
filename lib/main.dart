import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_jr/app/routers/routers.dart';
import 'package:projeto_jr/app/ui/tema.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cadastro de pessoas',
      debugShowCheckedModeBanner: false,
      theme: Tema.primary,
      getPages: [
        ...Routers.routers,
      ],
    );
  }
}
