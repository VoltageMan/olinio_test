import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olinio_test/features/add_edit_contact/add_edit_page.dart';
import 'package:olinio_test/features/bloc/contacts_bloc.dart';
import 'package:olinio_test/features/bloc/contacts_events.dart';
import 'package:olinio_test/features/bloc/contacts_state.dart';
import 'package:olinio_test/features/contact_list/contact_list.dart';
import 'package:olinio_test/utils/enums.dart';
import 'package:olinio_test/utils/helpers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olinio Test'),
        actions: [
          BlocBuilder<ContactsBloc, ContactsState>(builder: (ctx, state) {
            if (state.isChoosing) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<ContactsBloc>()
                            .add(const ChooseContactsEvent(cancel: true));
                      },
                      icon: const Icon(Icons.cancel)),
                  AppSpacing.horizontal_8,
                  IconButton(
                      onPressed: () {
                        context
                            .read<ContactsBloc>()
                            .add(const ChooseAllContactsEvent());
                      },
                      icon: const Icon(Icons.select_all)),
                ],
              );
            }
            return const SizedBox();
          })
        ],
      ),
      body: BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
        return state.state == ContactsStateEnum.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const ContactList();
      }),
      floatingActionButton:
          BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
        return FloatingActionButton(
          onPressed: () {
            if (state.isChoosing) {
              context
                  .read<ContactsBloc>()
                  .add(DeleteContactsEvent(state.choosedContacts));
              return;
            }
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const AddEditPage(),
              ),
            );
          },
          child: state.isChoosing
              ? const Icon(Icons.delete)
              : const Icon(Icons.add),
        );
      }),
    );
  }
}
