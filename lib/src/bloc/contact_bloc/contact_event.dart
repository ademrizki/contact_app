part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();
}

class AddNewContact extends ContactEvent {
  final String name;
  final String phoneNUmber;

  const AddNewContact({
    required this.name,
    required this.phoneNUmber,
  });

  @override
  List<Object?> get props => [name, phoneNUmber];
}

class DeleteContact extends ContactEvent {
  final int index;

  const DeleteContact(this.index);

  @override
  List<Object?> get props => [index];
}
