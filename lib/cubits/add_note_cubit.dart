import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/Widgets/constants.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit_cubit.dart';
part 'add_note_state.dart';

class addNoteCubit extends Cubit<AddNotesState> {
  addNoteCubit() : super(AddNotesInitial());
  Color color = const Color(0xffAC3931);
  Future<void> addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
