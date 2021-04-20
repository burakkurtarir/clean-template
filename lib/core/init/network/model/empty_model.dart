import 'package:clean_template/core/init/network/interface/INetworkModel.dart';

class EmptyModel extends INetworkModel<EmptyModel> {
  String? name;
  EmptyModel({this.name});

  EmptyModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }
    name = json['name'] as String?;
  }

  @override
  EmptyModel fromJson(Map<String, dynamic>? json) {
    return EmptyModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name ?? '';
    return data;
  }
}
