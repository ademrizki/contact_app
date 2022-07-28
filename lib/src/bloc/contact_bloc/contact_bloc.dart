import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, List<Map<String, dynamic>>> {
  ContactBloc() : super(<Map<String, dynamic>>[]) {
    /// Add New Contact
    on<AddNewContact>(
      (event, emit) {
        state.add({
          'name': event.name,
          'phone': event.phoneNUmber,
        });

        final List<Map<String, dynamic>> contacts = [...state];

        emit(contacts);
      },
    );

    /// Add New Contact
    on<DeleteContact>(
      (event, emit) {
        state.removeAt(event.index);

        final List<Map<String, dynamic>> contacts = [...state];

        emit(contacts);
      },
    );
  }
}
