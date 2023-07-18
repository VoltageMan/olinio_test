import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olinio_test/features/bloc/contacts_bloc.dart';
import 'package:olinio_test/features/bloc/contacts_events.dart';
import 'package:olinio_test/features/bloc/contacts_state.dart';
import 'package:olinio_test/features/contact_list/contact_widget.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  void initState() {
    context.read<ContactsBloc>().add(GetContactsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
      return ListView.builder(
        itemCount: state.contacts.length,
        itemBuilder: (context, index) {
          return ContactWidget(index: index);
        },
      );
    });
  }
}
