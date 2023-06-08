import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../model/student.dart';
import '../state/student_state.dart';

final studentViewModelProvider = 
  StateNotifierProvider<StudentViewModel, StudentState>(
    (ref) => StudentViewModel());

class StudentViewModel extends StateNotifier<StudentState> {
  StudentViewModel() : super(StudentState.initial());

  void addStudent(Student student) {
    state.students.add(student);

  }
}