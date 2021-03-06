import 'package:crud/model/user.dart';
import 'package:crud/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário de Usuário')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: _formData['name'],
                  decoration: InputDecoration(labelText: 'Nome: '),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'O campo NOME é obrigatório!';
                    } else if (value.trim().length < 3) {
                      return 'O campo NOME é muito curto!';
                    }

                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value),
              TextFormField(
                  initialValue: _formData['email'],
                  decoration: InputDecoration(labelText: 'E-mail: '),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'O campo EMAIL é obrigatório!';
                    } else if (value.trim().length < 3) {
                      return 'O campo EMAIL é muito curto!';
                    }

                    return null;
                  },
                  onSaved: (value) => _formData['email'] = value),
              TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration: InputDecoration(labelText: 'URL do Avatar: '),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'O campo URL AVATAR é obrigatório!';
                    } else if (value.trim().length < 3) {
                      return 'O campo URL AVATAR é muito curto!';
                    }

                    return null;
                  },
                  onSaved: (value) => _formData['avatarUrl'] = value)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final isValid = _form.currentState.validate();
          if (isValid) {
            _form.currentState.save();
            Provider.of<UserProvider>(context, listen: false).put(
              User(
                  id: _formData['id'],
                  name: _formData['name'],
                  email: _formData['email'],
                  avatarUrl: _formData['avatarUrl']),
            );
            Navigator.of(context).pop();
          }
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.green,
      ),
    );
  }
}
