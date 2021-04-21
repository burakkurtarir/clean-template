import '../../../../core/init/network/ICoreDio.dart';
import '../model/todo_model.dart';

abstract class IProfileService {
  final ICoreDio coreDio;

  IProfileService({required this.coreDio});

  Future<List<TodoModel>?> fetchTodos();
}
