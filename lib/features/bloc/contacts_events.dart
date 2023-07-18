import 'package:olinio_test/models/contact.dart';

abstract class ContactsEvent {
  const ContactsEvent();
}

class GetContactsEvent extends ContactsEvent {}

class DeleteContactsEvent extends ContactsEvent {
  final List<Contact> contacts;
  const DeleteContactsEvent(this.contacts);
}

class UpdateContactEvent extends ContactsEvent {
  final Contact contact;
  const UpdateContactEvent(this.contact);
}

class SaveContactEvent extends ContactsEvent {
  final Contact contact;
  const SaveContactEvent(this.contact);
}

class ChooseContactsEvent extends ContactsEvent {
  final Contact? choosedContact;
  final bool cancel;
  const ChooseContactsEvent({this.choosedContact, this.cancel = false});
}

class ChooseAllContactsEvent extends ContactsEvent {
  const ChooseAllContactsEvent();
}
