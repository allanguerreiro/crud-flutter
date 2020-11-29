import 'package:crud/component/user_tile.dart';
import 'package:crud/provider/users.dart';
import 'package:crud/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Lista de Usuários')),
        ),
        body: ListView.builder(
            itemCount: users.count,
            itemBuilder: (ctx, i) => UserTile(users.byIndex(i))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoute.USER_FORM);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ));
  }
}
