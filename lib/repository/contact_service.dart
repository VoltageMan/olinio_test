import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:olinio_test/models/contact.dart';
import 'package:olinio_test/models/country.dart';
import '../data/local_data.dart';

class ContactService {
  Future<Country> getCountryByCode(String code) async {
    final countries = await getAllCountries();
    final country = countries.firstWhere((element) => element.code == code);
    return country;
  }

  Future<List<Country>> getAllCountries() async {
    final json = await rootBundle.loadString('assets/dropdown.json');
    final List<dynamic> countryList = jsonDecode(json);
    return countryList
        .map((e) => Country.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<bool> saveContact(Contact contact) async {
    return await DataBase.writeData(contact);
  }

  Future<List<Contact>> getContacts() async {
    final listOfData = await DataBase.readData();
    return listOfData.map((contact) => Contact.fromJson(contact)).toList();
  }

  Future<bool> updateContact(Contact contact) async {
    return await DataBase.updateData(contact);
  }

  Future<bool> deleteContacts(List<Contact> contacts) async {
    final List<String> contactPhones = contacts.map((e) => e.phone).toList();
    return await DataBase.deleteData(contactPhones);
  }
}
