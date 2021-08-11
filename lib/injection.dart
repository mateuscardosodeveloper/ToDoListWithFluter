import 'package:app/app/domain/interfaces/todo_dao.dart';
import 'package:app/app/domain/services/todo_service.dart';
import 'package:get_it/get_it.dart';

import 'app/database/sqlite/dao/todo_dao_impl.dart';

setupInjection() async{
  GetIt getIt = GetIt.I;
  
/*   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); */

  getIt.registerSingleton<TodoDAO>(TodoDAOImpl());
  getIt.registerSingleton<TodoService>(TodoService());
}
