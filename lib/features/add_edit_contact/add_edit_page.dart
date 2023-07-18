import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olinio_test/features/app.dart';
import 'package:olinio_test/features/bloc/contacts_bloc.dart';
import 'package:olinio_test/features/bloc/contacts_events.dart';
import 'package:olinio_test/main.dart';
import 'package:olinio_test/models/contact.dart';
import 'package:olinio_test/models/country.dart';
import 'package:olinio_test/repository/contact_service.dart';
import 'package:olinio_test/utils/enums.dart';
import 'package:olinio_test/utils/helpers.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({super.key, this.contact});
  final Contact? contact;

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late String? selectedCountryCode;

  final contactsRepo = getIt<ContactService>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    selectedCountryCode = countries.first.code;

    if (widget.contact != null) {
      nameController.text = widget.contact!.name;
      surnameController.text = widget.contact!.surname;
      phoneController.text = widget.contact!.phone;
      emailController.text = widget.contact!.email;
      selectedCountryCode = widget.contact!.countryCode;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  bool checkAll() {
    if (nameController.text != '' &&
        surnameController.text != '' &&
        phoneController.text != '' &&
        emailController.text != '') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final contactsBloc = context.read<ContactsBloc>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.contact == null ? 'Add Contact' : 'Edit Contact'),
      ),
      body: ListView(
        padding: AppPaddings.horizontal_12Padding,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              label: Text('Name'),
            ),
            textInputAction: TextInputAction.next,
          ),
          AppSpacing.vertical_8,
          TextField(
            controller: surnameController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              label: Text('Surname'),
            ),
          ),
          AppSpacing.vertical_8,
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(label: Text('Phone')),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
          ),
          AppSpacing.vertical_8,
          TextField(
            controller: emailController,
            decoration: const InputDecoration(label: Text('Email')),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
          ),
          AppSpacing.vertical_8,
          FittedBox(
            child: DropdownButton(
              value: selectedCountryCode,
              items: countries
                  .map(
                    (item) => DropdownMenuItem(
                      value: item.code,
                      child: Text(item.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedCountryCode = value;
                  });
                }
              },
            ),
          ),
          AppSpacing.vertical_8,
          Builder(builder: (ctx) {
            return ElevatedButton(
              onPressed: () {
                if (checkAll()) {
                  final newContact = Contact(
                    email: emailController.text,
                    name: nameController.text,
                    phone: phoneController.text,
                    surname: surnameController.text,
                    countryCode: selectedCountryCode!,
                  );
                  if (widget.contact != null) {
                    contactsBloc.add(
                      UpdateContactEvent(newContact),
                    );
                  } else {
                    if (contactsBloc.state.contacts.any(
                        (element) => element.phone == phoneController.text)) {
                      ScaffoldMessenger.of(ctx).clearSnackBars();
                      ScaffoldMessenger.of(ctx).showSnackBar(
                        const SnackBar(
                          content: Text('This phone already saved'),
                        ),
                      );
                      return;
                    }
                    contactsBloc.add(
                      SaveContactEvent(newContact),
                    );
                  }

                  if (contactsBloc.state.state == ContactsStateEnum.error) {
                    ScaffoldMessenger.of(ctx).clearSnackBars();
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      const SnackBar(
                        content: Text('Error with saving, try again'),
                      ),
                    );
                    return;
                  }
                  Navigator.of(context).pop();
                  return;
                }
                ScaffoldMessenger.of(ctx).clearSnackBars();
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(
                    content: Text('Fill all fields'),
                  ),
                );
              },
              child: const Text('Save'),
            );
          })
        ],
      ),
    );
  }
}
