import 'package:contact_app/src/bloc/contact_bloc/contact_bloc.dart';
import 'package:contact_app/src/view/screen/create_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ContactBloc contactBloc;

  @override
  void initState() {
    contactBloc = ContactBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<ContactBloc, List<Map<String, dynamic>>>(
        bloc: contactBloc,
        builder: (context, state) {
          if (state.isEmpty) {
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
              itemCount: state.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                final contact = state[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: ListTile(
                    title: Text(contact['name']),
                    subtitle: Text(contact['phone']),
                    tileColor: Colors.green.withOpacity(0.2),
                    leading: const Icon(Icons.person_pin, size: 38),
                    trailing: IconButton(
                      onPressed: () => contactBloc.add(
                        DeleteContact(index),
                      ),
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
            contactBloc.add(
              AddNewContact(
                name: newContact['name'],
                phoneNUmber: newContact['phone'],
              ),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
