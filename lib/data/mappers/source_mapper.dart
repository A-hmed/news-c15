import 'package:news_c15/data/model/source_response.dart';
import 'package:news_c15/domain/model/source.dart';

class SourceMapper {
  Source fromDataModel(SourceResponse source) {
    return Source(id: source.id ?? "", name: source.name ?? "");
  }

  List<Source> fromDataModels(List<SourceResponse> sources) {
    return sources.map(fromDataModel).toList();
  }
}
