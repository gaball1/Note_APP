import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/cubits/add_note_cubit.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubit extends Cubit<AddNotesState> {
  AddNoteCubit() : super(AddNotesInitial());
}
