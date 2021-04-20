import 'package:clean_template/core/init/network/interface/INetworkModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends INetworkModel<TodoModel> {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoModel({this.userId, this.id, this.title, this.completed});

  @override
  TodoModel fromJson(Map<String, Object?> json) {
    return _$TodoModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$TodoModelToJson(this);
  }
}
