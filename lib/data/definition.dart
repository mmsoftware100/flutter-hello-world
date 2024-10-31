import 'package:json_annotation/json_annotation.dart';

part 'definition.g.dart';
class Definition{

  @JsonKey(name: 'definition', defaultValue: "")
  String definition;


  Definition({
    required this.definition,
  });


  factory Definition.fromJson(Map<String, dynamic> json) {
    return _$DefinitionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DefinitionToJson(this);
}