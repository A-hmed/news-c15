import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_c15/data/model/source.dart';

class SourceAdapter extends TypeAdapter<Source>{
  @override
  Source read(BinaryReader reader) {
    var json = reader.readMap();
    return Source.fromJson(json);
  }
  @override
  void write(BinaryWriter writer, Source obj) {
    writer.writeMap(obj.toJson());
  }

  @override
  int get typeId => 1;

}