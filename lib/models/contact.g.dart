// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      surname: json['surname'] as String,
      countryCode: json['countryCode'] as String,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'phone': instance.phone,
      'email': instance.email,
      'countryCode': instance.countryCode,
    };
