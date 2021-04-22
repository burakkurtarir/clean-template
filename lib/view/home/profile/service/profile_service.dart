import '../../../../core/constants/enums/http_types.dart';
import '../../../../core/init/network/ICoreDio.dart';
import '../../../../product/enums/network_route.dart';
import '../model/todo_model.dart';
import 'IProfileService.dart';

class ProfileService extends IProfileService {
  ProfileService({required ICoreDio coreDio}) : super(coreDio: coreDio);

  @override
  Future<List<TodoModel>?> fetchTodos() async {
    final response = await coreDio.send(
      path: NetworkRoute.TODOS,
      type: HttpTypes.GET,
      parseModel: TodoModel(),
    );
    return response.data;
  }
}
