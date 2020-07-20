import 'package:cadastro_usuario_growdev/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Lista de Usuários'),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRotas.USER_LIST);
          },
        ),
      ),
    );
  }
}
