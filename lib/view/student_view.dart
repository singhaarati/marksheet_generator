import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/student.dart';
import '../view_model/student_viewmodel.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  String? selectedModule;
  List<String> modules = [
    "Flutter",
    "Web Api",
    "Design and Thinking",
    "Individual Project",
  ];

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final markController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var studentState = ref.watch(studentViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("student"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("enter  your first name")),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("enter your last name")),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: ' Select Module',
                border: OutlineInputBorder(),
              ),
              items: modules
                  .map(
                    (module) => DropdownMenuItem(
                      value: module,
                      child: Text(module),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedModule = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: markController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("enter marks")),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Student student = Student(
                    fname: firstNameController.text.trim(),
                    lname: lastNameController.text.trim(),
                    mark: markController.text.trim());

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("student added sucessfully"),
                  backgroundColor: Colors.green,
                ));
                ref.read(studentViewModelProvider.notifier).addStudent(student);
              },
              child: const Text("ADD"),
            ),
            studentState.students.isNotEmpty
                ? const Text("data")
                : const Text("no data"),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/studentresult');
                },
                child: const Text('View result'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
