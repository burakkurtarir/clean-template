import 'package:clean_template/core/constants/enums/http_types.dart';
import 'package:clean_template/core/init/network/ICoreDio.dart';
import 'package:clean_template/product/enums/network_route.dart';
import 'package:clean_template/view/home/profile/model/todo_model.dart';
import 'package:clean_template/view/home/profile/service/IProfileService.dart';

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
