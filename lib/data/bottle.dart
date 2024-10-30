
import 'package:json_annotation/json_annotation.dart';

//  flutter pub run build_runner build

part 'bottle.g.dart';
@JsonSerializable(explicitToJson: true)
class Bottle{

  @JsonKey(name: 'id' ,defaultValue: 0)
  int id;

  @JsonKey(name: 'photo_url' ,defaultValue: "")
  String photoUrl;


  @JsonKey(name: 'name' ,defaultValue: "")
  String name;


  @JsonKey(name: 'price' ,defaultValue: 0)
  int price;

  @JsonKey(name: 'favourite' ,defaultValue: false)
  bool favourite;

  Bottle({
    required this.id,
    required this.photoUrl,
    required this.name,
    required this.price,
    required this.favourite,
  });

  factory Bottle.fromJson(Map<String, dynamic> json) {
    return _$BottleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BottleToJson(this);

}