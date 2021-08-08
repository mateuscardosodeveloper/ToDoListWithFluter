import 'package:app/app/my_app.dart';
import 'package:app/app/views/add_todo_dialog.dart';
import 'package:app/app/views/completed_list.dart';
import 'package:app/app/views/todo_list_back.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListBack(),
      CompletedList(),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
            selectedIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              label: 'ToDos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done, size: 28),
              label: 'Completed',
            ),
          ],
        ),
        body: tabs[selectedIndex],
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.black,
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AddTodoDialog(),
            barrierDismissible: false,
          ),
          child: Icon(Icons.add),
        ));
  }
}
