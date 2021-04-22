import '../../../../core/constants/enums/http_types.dart';
import '../../../../core/init/network/ICoreDio.dart';
import '../../../../product/enums/network_route.dart';
import '../model/todo_model.dart';
import 'IExploreService.dart';

class ExploreService extends IExploreService {
  ExploreService({required ICoreDio coreDio}) : super(coreDio: coreDio);

  @override
  Future<List<TodoModel>?> fetchTodos() async {
    final response = await coreDio.send<List<TodoModel>, TodoModel>(
      path: NetworkRoute.TODOS,
      type: HttpTypes.GET,
      parseModel: TodoModel(),
    );

    if (response.data != null) {
      return response.data;
    }
    return [];
  }
}
