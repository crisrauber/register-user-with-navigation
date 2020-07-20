import 'package:flutter/material.dart';

import '../entidades/usuario.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final emailController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _form = GlobalKey<FormState>();

  final usuario = Usuario();

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Cadastro de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {},
          ),
        ],
        leading: new Container(),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Form(
                autovalidate: true,
                key: _form,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        labelStyle: TextStyle(color: Colors.teal),
                        labelText: 'Nome completo',
                      ),
                      controller: nomeController,
                      validator: (valor) {
                        if (valor.length < 3) return 'Nome muito curto';
                        return null;
                      },
                      onSaved: (valor) {
                        usuario.nome = valor;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        labelStyle: TextStyle(color: Colors.teal),
                        labelText: 'Idade',
                      ),
                      keyboardType: TextInputType.number,
                      controller: idadeController,
                      validator: (valor) {
                        if ((int.tryParse(valor) ?? 0) <= 0)
                          return 'Idade Inválida';

                        return null;
                      },
                      onSaved: (valor) {
                        usuario.idade = int.tryParse(valor);
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        labelStyle: TextStyle(color: Colors.teal),
                        labelText: 'Email',
                      ),
                      controller: emailController,
                      validator: (valor) {
                        if (valor.length < 3) return 'Email muito curto';
                        return null;
                      },
                      onSaved: (valor) {
                        usuario.email = valor;
                      },
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: double.maxFinite,
                      child: TesteButtom(
                        () {
                          if (_form.currentState.validate()) {
                            setState(() {
                              _form.currentState.save();
                              Navigator.of(context).pop(usuario);
                            });
                            _scaffoldKey.currentState
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  duration: Duration(
                                    seconds: 2,
                                  ),
                                  content: Text('Salvou legal!'),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TesteButtom extends StatelessWidget {
  final void Function() onPressed;

  TesteButtom(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        /* Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('usuário salvo'),
          ),
        ); */
        onPressed();
      },
      child: Text(
        'Salvar',
        style: TextStyle(fontSize: 18),
      ),
      textColor: Colors.teal,
      borderSide: BorderSide(
        color: Colors.teal,
      ),
    );
  }
}
