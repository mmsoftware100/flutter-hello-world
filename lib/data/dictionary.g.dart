// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dictionary _$DictionaryFromJson(Map<String, dynamic> json) => Dictionary(
      word: json['word'] as String? ?? '',
      meanings: (json['meanings'] as List<dynamic>?)
              ?.map((e) => Meaning.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DictionaryToJson(Dictionary instance) =>
    <String, dynamic>{
      'word': instance.word,
      'meanings': instance.meanings.map((e) => e.toJson()).toList(),
    };
