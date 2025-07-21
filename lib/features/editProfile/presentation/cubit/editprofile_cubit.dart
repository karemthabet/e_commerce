import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'editprofile_state.dart';

class EditprofileCubit extends Cubit<EditprofileState> {
  EditprofileCubit() : super(EditprofileInitial());
}
