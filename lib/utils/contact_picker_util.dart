// import 'dart:convert';
// import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:ink_mobile/utils/permissions_util.dart';

// class ContactPickerUtil {
//   PermissionsUtil permissions = PermissionsUtil(PermissionType.contacts);

//   Future<String?> getContactsJson() async {
//     bool gotAccess = await permissions.askPermissions();
//     if (gotAccess) {
//       List<Contact> contacts = await FlutterContacts.getContacts();
//       List<Map> contactsMap = [];
//       contacts.forEach((element) => contactsMap.add(element.toMap()));
//       contactsMap.forEach((element) => print(jsonEncode(element)));
//       return jsonEncode(contactsMap.asMap());
//     }
//     return null;
//   }
// }