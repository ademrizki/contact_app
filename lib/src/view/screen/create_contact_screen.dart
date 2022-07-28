import 'package:flutter/material.dart';

class CreateContactScreen extends StatefulWidget {
  const CreateContactScreen({Key? key}) : super(key: key);

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Name Field
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: nameController,
                  textCapitalization: TextCapitalization.words,
                  validator: (String? value) =>
                      value == null || value == '' || value.length < 3
                          ? 'Add Name Properly'
                          : null,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    filled: true,
                  ),
                ),
              ),

              /// Phone Number Field
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (String? value) =>
                      value == null || value == '' || value.length < 11
                          ? 'Add Phone Number Properly'
                          : null,
                  decoration: const InputDecoration(
                    label: Text('Phone number'),
                    filled: true,
                  ),
                ),
              ),

              /// Create Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                    double.infinity,
                    42,
                  ),
                ),
                child: const Text('CREATE CONTACT'),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    final Map<String, dynamic> newContact = {
                      'name': nameController.text.trim(),
                      'phone': phoneController.text.trim(),
                    };

                    Navigator.pop(context, newContact);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
