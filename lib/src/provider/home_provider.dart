import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final List contactList = <Map<String, dynamic>>[];

  /// Add new contact
  void addNewContact({
    required String name,
    required String phoneNumber,
  }) {
    contactList.add(
      {
        'name': name,
        'phone': phoneNumber,
      },
    );

    notifyListeners();
  }

  /// Remove contact
  void removeContact({required int index}) {
    contactList.removeAt(index);

    notifyListeners();
  }
}
