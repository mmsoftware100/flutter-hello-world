import 'package:json_annotation/json_annotation.dart';

import 'meaning.dart';

part 'dictionary.g.dart';
@JsonSerializable(explicitToJson: true)
class Dictionary {
  @JsonKey(name: 'word', defaultValue: "")
  String word;

  @JsonKey(name: 'meanings', defaultValue: [])
  List<Meaning> meanings;

  Dictionary({
    required this.word,
    required this.meanings,
  });

  factory Dictionary.fromJson(Map<String, dynamic> json) {
    return _$DictionaryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DictionaryToJson(this);
}
