import 'package:crud/provider/users.dart';
import 'package:crud/route/app_route.dart';
import 'package:crud/view/user_form.dart';
import 'package:crud/view/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoute.HOME: (_) => UserList(),
          AppRoute.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}
