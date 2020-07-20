import 'package:cadastro_usuario_growdev/pages/app_page.dart';
import 'package:cadastro_usuario_growdev/pages/cadastro_page.dart';
import 'package:cadastro_usuario_growdev/pages/users_list.dart';
import 'package:cadastro_usuario_growdev/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cadastro Usuario',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          // AppRotas.INICIAL: (ctx) => AppPage(),
          AppRotas.REGISTER_USER: (ctx) => CadastroPage(),
          AppRotas.USER_LIST: (ctx) => UsersList(),
        });
    // home: DialogPage());
  }
}
