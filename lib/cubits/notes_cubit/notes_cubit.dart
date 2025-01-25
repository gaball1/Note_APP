import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/Widgets/constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    //List<NoteModel> notes =notesBox.values.toList();
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
