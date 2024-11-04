
import 'package:json_annotation/json_annotation.dart';

//  flutter pub run build_runner build

part 'user.g.dart';
@JsonSerializable(explicitToJson: true)
class User{

  @JsonKey(name: 'fullName' ,defaultValue: "")
  String fullName;

  @JsonKey(name: 'password' ,defaultValue: "")
  String password;

  @JsonKey(name: 'email' ,defaultValue: "")
  String email;


  User({
    required this.fullName,
    required this.password,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

}