import 'package:olinio_test/models/contact.dart';
import 'package:olinio_test/utils/enums.dart';

class ContactsState {
  final List<Contact> contacts;
  final String? errorMessage;
  final List<Contact> choosedContacts;
  final ContactsStateEnum state;
  final bool isChoosing;

  ContactsState(
      {this.contacts = const [],
      this.choosedContacts = const [],
      this.errorMessage,
      this.state = ContactsStateEnum.idle,
      this.isChoosing = false});

  ContactsState update(
      {List<Contact>? contacts,
      String? errorMessage,
      List<Contact>? choosedContacts,
      ContactsStateEnum? state,
      bool? isChoosing}) {
    return ContactsState(
      contacts: contacts ?? this.contacts,
      errorMessage: errorMessage,
      choosedContacts: choosedContacts ?? this.choosedContacts,
      state: state ?? this.state,
      isChoosing: isChoosing ?? this.isChoosing,
    );
  }
}
