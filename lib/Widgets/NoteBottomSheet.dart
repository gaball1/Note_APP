import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteapp/Widgets/Add_Note_bottom_form.dart';
import 'package:noteapp/cubits/add_note_cubit.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';

class AddNoteBottomsheet extends StatelessWidget {
  AddNoteBottomsheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addNoteCubit(),
      child: BlocConsumer<addNoteCubit, AddNotesState>(
        listener: (context, State) {
          if (State is AddNoteFailure) {}
          if (State is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
