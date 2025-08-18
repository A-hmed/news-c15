import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_c15/data/model/source_response.dart';

class SourceAdapter extends TypeAdapter<SourceResponse>{
  @override
  SourceResponse read(BinaryReader reader) {
    var json = reader.readMap();
    return SourceResponse.fromJson(json);
  }
  @override
  void write(BinaryWriter writer, SourceResponse obj) {
    writer.writeMap(obj.toJson());
  }

  @override
  int get typeId => 1;

}