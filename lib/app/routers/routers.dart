import 'package:get/get.dart';
import 'package:projeto_jr/app/data/controllers/home_controller.dart';
import 'package:projeto_jr/app/data/repository/person_repository.dart';
import 'package:projeto_jr/app/pages/register/cadastro_page.dart';
import 'package:projeto_jr/app/pages/home/home_page.dart';
import 'package:projeto_jr/app/pages/login/login_page.dart';
import 'package:projeto_jr/app/pages/update/update_page.dart';

class Routers {
  Routers._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => PersonRepository());
        Get.put(HomeController(repository: Get.find()));
      }),
    ),
    GetPage(
      name: '/register',
      page: () => const CadastroPage(),
    ),
    GetPage(
      name: '/update',
      page: () => const UpdatePage(),
    ),
  ];
}
