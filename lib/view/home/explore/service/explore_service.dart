import 'package:clean_template/core/constants/enums/http_types.dart';
import 'package:clean_template/core/init/network/ICoreDio.dart';
import 'package:clean_template/product/enums/network_route.dart';
import 'package:clean_template/view/home/explore/model/todo_model.dart';
import 'package:clean_template/view/home/explore/service/IExploreService.dart';

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
