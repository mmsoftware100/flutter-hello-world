import 'package:json_annotation/json_annotation.dart';

import 'definition.dart';

part 'meaning.g.dart';

@JsonSerializable()
class Meaning {
  @JsonKey(name: 'partOfSpeech', defaultValue: "")
  String partOfSpeech;

  @JsonKey(name: 'definitions', defaultValue: [])
  List<Definition> definitions;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return _$MeaningFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MeaningToJson(this);
}
