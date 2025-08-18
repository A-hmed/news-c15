import 'package:news_c15/domain/model/source.dart';

class SourceResponse {
  SourceResponse({
      this.id, 
      this.name,
  });

  SourceResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String? id;
  String? name;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}