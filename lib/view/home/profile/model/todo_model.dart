import 'package:clean_template/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends BaseModel<TodoModel> {
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
