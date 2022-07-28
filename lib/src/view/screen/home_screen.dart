import 'package:contact_app/src/view/screen/create_contact_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: 3,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: ListTile(
            title: const Text('Name'),
            subtitle: const Text('0811'),
            tileColor: Colors.green.withOpacity(0.2),
            leading: const Icon(Icons.person_pin, size: 38),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateContactScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
