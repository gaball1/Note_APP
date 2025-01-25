import 'package:flutter/material.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/Widgets/Edit-NOte-viewBody.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(note: note),
    );
  }
}
