import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/Widgets/Custom-App-Bar.dart';
import 'package:noteapp/Widgets/colors-list-view.dart';
import 'package:noteapp/Widgets/constants.dart';
import 'package:noteapp/Widgets/custom-text-field.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: "Edit Note",
            icon: Icons.check,
          ),
          const SizedBox(height: 50),
          CustomTextField(
              onchanged: (value) {
                title = value;
              },
              Hint: widget.note.title),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
            onchanged: (value) {
              content = value;
            },
            Hint: widget.note.subtitle,
            maxlines: 5,
          ),
          const SizedBox(height: 32),
          EditNoteColor(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}

class EditNoteColor extends StatefulWidget {
  const EditNoteColor({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColor> createState() => _EditNoteColorState();
}

class _EditNoteColorState extends State<EditNoteColor> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = KColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: KColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color = KColors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  isActive: currentIndex == index,
                  color: KColors[index],
                ),
              ),
            );
          }),
    );
    ;
  }
}
