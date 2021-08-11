import 'package:app/app/domain/entities/todo.dart';
import 'package:app/app/domain/interfaces/todo_dao.dart';
import 'package:get_it/get_it.dart';

class TodoService {
  var _dao = GetIt.I.get<TodoDAO>();

  save(Todo todo) {
    todo.title;
    todo.description;
    _dao.save(todo);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Todo>> find() {
    return _dao.find();
  }
}
