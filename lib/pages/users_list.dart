import 'package:cadastro_usuario_growdev/entidades/usuario.dart';
import 'package:cadastro_usuario_growdev/utils/app_routes.dart';
import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<Usuario> users = <Usuario>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Lista de Usuários'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.gravatar.com/avatar/$index?d=robohash'),
                  ),
                  title: Text('${users[index].nome}, ${users[index].idade}'),
                  subtitle: Text(users[index].email),
                );
              },
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(Icons.add),
            onPressed: () async {
              var usuario =
                  await Navigator.of(context).pushNamed(AppRotas.REGISTER_USER);

              setState(() {
                if (usuario != null) {
                  users.add(usuario);
                }
              });
            },
          )
        ],
      ),
    );
  }
}
