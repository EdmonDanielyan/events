// import 'dart:convert';
//
// import 'package:contacts_service/contacts_service.dart';
//
// class ContactPickerCubit {
//   static Future<String> getContactsJson() async {
//     List<Contact> contacts = await ContactsService.getContacts();
//     Map contactsMap = contacts.map((e) => e.toMap()).toList().asMap();
//     String contactsJson = jsonEncode(contactsMap);
//     print(contactsJson);
//     return contactsJson;
//   }
// }