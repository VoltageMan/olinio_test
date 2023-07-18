import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  final String name, surname, phone, email, countryCode;
  Contact({
    required this.email,
    required this.name,
    required this.phone,
    required this.surname,
    required this.countryCode,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  Map<String, dynamic> toJsonWithOnlyCountryCode() {
    return {
      'name': name,
      'surname': surname,
      'phone': phone,
      'email': email,
      'countryCode': countryCode,
    };
  }
}
