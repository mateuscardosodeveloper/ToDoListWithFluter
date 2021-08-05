import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/domain/entities/todo.dart';
import 'package:app/database/todos.dart';
import 'package:app/views/todo_all.dart';

class TodoListBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
              'No todos.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoAll(todo: todo);
            },
          );
  }
}
