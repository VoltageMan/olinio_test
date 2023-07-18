import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olinio_test/features/add_edit_contact/add_edit_page.dart';
import 'package:olinio_test/features/bloc/contacts_bloc.dart';
import 'package:olinio_test/features/bloc/contacts_events.dart';
import 'package:olinio_test/features/bloc/contacts_state.dart';
import 'package:olinio_test/features/contact_list/choose_widget.dart';
import 'package:olinio_test/models/contact.dart';
import 'package:olinio_test/utils/helpers.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key, required this.index});
  final int index;

  bool isContactChoosed(String phone, List<Contact> choosedContacts) {
    if (choosedContacts.any((element) => element.phone == phone)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final contact = context.read<ContactsBloc>().state.contacts[index];
    return BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
      return Container(
        margin: AppPaddings.vertical_8Padding,
        padding: AppPaddings.horizontal_8Padding,
        child: ListTile(
          onTap: () {
            if (state.isChoosing) {
              context
                  .read<ContactsBloc>()
                  .add(ChooseContactsEvent(choosedContact: contact));
            }
          },
          onLongPress: () {
            if (state.isChoosing) return;
            context
                .read<ContactsBloc>()
                .add(ChooseContactsEvent(choosedContact: contact));
          },
          title: Text('${contact.surname} ${contact.name}'),
          subtitle: Text(
            '${contact.phone}\n${contact.email}',
            maxLines: 2,
          ),
          isThreeLine: true,
          trailing: state.isChoosing
              ? ChooseWidget(
                  isChoosed: isContactChoosed(
                    contact.phone,
                    state.choosedContacts,
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => AddEditPage(
                          contact: contact,
                        ),
                      ),
                    );
                  },
                ),
        ),
      );
    });
  }
}
