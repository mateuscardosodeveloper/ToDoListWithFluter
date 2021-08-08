import 'package:app/app/database/todo_dao_implement.dart';
import 'package:flutter/material.dart';
import 'package:app/app/views/home_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  static final String title = 'ToDoList';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home: HomePage(),
        ),
      );
}
