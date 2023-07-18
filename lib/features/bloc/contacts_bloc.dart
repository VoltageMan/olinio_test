import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olinio_test/features/bloc/contacts_events.dart';
import 'package:olinio_test/features/bloc/contacts_state.dart';
import 'package:olinio_test/main.dart';
import 'package:olinio_test/models/contact.dart';
import 'package:olinio_test/repository/contact_service.dart';
import 'package:olinio_test/utils/enums.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsState()) {
    on<GetContactsEvent>(_getContacts);
    on<DeleteContactsEvent>(_deleteContacts);
    on<UpdateContactEvent>(_updateContacts);
    on<ChooseContactsEvent>(_chooseContacts);
    on<ChooseAllContactsEvent>(_chooseAllContacts);
    on<SaveContactEvent>(_saveContact);
  }

  String defaultErrorMessage = 'Something is wrong, try again';

  FutureOr<void> _getContacts(
      GetContactsEvent event, Emitter<ContactsState> emit) async {
    emit(state.update(state: ContactsStateEnum.loading));
    final result = await getIt<ContactService>().getContacts();
    emit(state.update(contacts: result, state: ContactsStateEnum.success));
  }

  FutureOr<void> _deleteContacts(
      DeleteContactsEvent event, Emitter<ContactsState> emit) async {
    emit(state.update(isChoosing: false, state: ContactsStateEnum.loading));
    final result = await getIt<ContactService>().deleteContacts(event.contacts);
    final newContacts = await getIt<ContactService>().getContacts();
    if (result) {
      emit(state.update(
          isChoosing: false,
          state: ContactsStateEnum.success,
          contacts: newContacts));
    } else {
      emit(state.update(
          isChoosing: false,
          errorMessage: defaultErrorMessage,
          state: ContactsStateEnum.error));
    }
  }

  FutureOr<void> _saveContact(
      SaveContactEvent event, Emitter<ContactsState> emit) async {
    emit(state.update(state: ContactsStateEnum.loading));
    final result = await getIt<ContactService>().saveContact(event.contact);
    final newContacts = await getIt<ContactService>().getContacts();
    if (result) {
      emit(state.update(
          state: ContactsStateEnum.success, contacts: newContacts));
      log('success ${state.contacts}');
    } else {
      emit(state.update(
          errorMessage: defaultErrorMessage, state: ContactsStateEnum.error));
      log('error ${state.contacts}');
    }
  }

  FutureOr<void> _chooseAllContacts(
      ChooseAllContactsEvent event, Emitter<ContactsState> emit) async {
    List<Contact> chosenContacts = state.choosedContacts;
    if (state.choosedContacts.isEmpty) {
      chosenContacts = state.contacts;
    } else {
      chosenContacts = [];
    }

    emit(state.update(isChoosing: true, choosedContacts: chosenContacts));
  }

  FutureOr<void> _chooseContacts(
      ChooseContactsEvent event, Emitter<ContactsState> emit) async {
    if (event.cancel) {
      emit(state.update(isChoosing: false, choosedContacts: []));
      return;
    }

    List<Contact> chosenContacts = [...state.choosedContacts];
    if (state.choosedContacts.contains(event.choosedContact)) {
      log('STATE CONTACTS ---- ${state.contacts}');
      chosenContacts.removeWhere(
          (element) => element.phone == event.choosedContact!.phone);
      log('STATE CONTACTS after ---- ${state.contacts}');
    } else {
      chosenContacts = [
        ...state.choosedContacts,
        ...[event.choosedContact!]
      ];
    }

    emit(state.update(isChoosing: true, choosedContacts: chosenContacts));
  }

  FutureOr<void> _updateContacts(
      UpdateContactEvent event, Emitter<ContactsState> emit) async {
    emit(state.update(state: ContactsStateEnum.loading));
    final result = await getIt<ContactService>().updateContact(event.contact);
    final newContacts = await getIt<ContactService>().getContacts();
    if (result) {
      emit(state.update(
          state: ContactsStateEnum.success, contacts: newContacts));
    } else {
      emit(state.update(
          state: ContactsStateEnum.error, errorMessage: defaultErrorMessage));
    }
  }
}
