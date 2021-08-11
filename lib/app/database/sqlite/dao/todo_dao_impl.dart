import 'package:app/app/domain/entities/todo.dart';
import 'package:app/app/domain/interfaces/todo_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';


class TodoDAOImpl implements TodoDAO{
  Database _db;
  

  @override
  Future<List<Todo>> find() async {
    _db = await  Connection.get();
    List<Map<String,dynamic>> resultado =  await _db.query('contact');
    List<Todo> list = List.generate( resultado.length, (i){
      var lign = resultado[i];
      return Todo(
        id : lign['id'],
        createdTime: lign['created_time'],
        title: lign['title'],
        description: lign['description'],
        isDone:  lign['is_done']
      );
    }
    );

    return list;
  }

  @override
  remove(dynamic id) async {
    _db = await  Connection.get();
    var sql ='DELETE FROM contact WHERE id = ?';
    _db.rawDelete(sql, [id]);
    }
  
    @override
  save(Todo todo) async {
    _db = await  Connection.get();
    var sql;
    if(todo.id == null){
      sql = 'INSERT INTO todo (created_time, title, description, is_done) VALUES (?,?,?,?)';
      _db.rawInsert(sql,[todo.createdTime,todo.title,todo.description,todo.isDone]);
    }else{
      sql = 'UPDATE todo SET created_time = ?, title =?, description = ?, is_done= ? WHERE id = ?';
      _db.rawUpdate(sql,[todo.createdTime, todo.title, todo.description, todo.isDone, todo.id]);
    }
  }

}
