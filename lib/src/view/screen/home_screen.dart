import 'package:contact_app/src/provider/home_provider.dart';
import 'package:contact_app/src/view/screen/create_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          if (provider.contactList.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.people_outline),
                  Text('Your contact is empty'),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.contactList.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                final contact = provider.contactList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: ListTile(
                    title: Text(contact['name']),
                    subtitle: Text(contact['phone']),
                    tileColor: Colors.green.withOpacity(0.2),
                    leading: const Icon(Icons.person_pin, size: 38),
                    trailing: IconButton(
                      onPressed: () => provider.removeContact(index: index),
                      icon: const Icon(Icons.delete),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Map<String, dynamic>? newContact = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateContactScreen(),
            ),
          );

          if (newContact != null) {
            homeProvider.addNewContact(
              name: newContact['name'],
              phoneNumber: newContact['phone'],
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
