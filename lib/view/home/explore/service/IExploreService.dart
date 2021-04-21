import '../../../../core/init/network/ICoreDio.dart';
import '../model/todo_model.dart';

abstract class IExploreService {
  final ICoreDio coreDio;

  IExploreService({required this.coreDio});

  Future<List<TodoModel>?> fetchTodos();
}
