import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentResult extends ConsumerStatefulWidget {
  const StudentResult({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentResultState();
}

class _StudentResultState extends ConsumerState<StudentResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("result"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          // height: double.infinity,
          // width: double.infinity,
          child: DataTable(
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.green),
              border: TableBorder.all(color: Colors.black),
              columns: const [
                DataColumn(
                  label: Expanded(
                    child: Text("FName",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                DataColumn(
                    label: Expanded(
                        child: Text("LName",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)))),
                DataColumn(
                  label: Expanded(
                      child: Center(
                    child: Text("Module",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  )),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text("mark",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text("Total",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text("Result",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Center(child: Text("aarati"))),
                    DataCell(Center(child: Text("singh"))),
                    DataCell(Center(child: Text("Flutter"))),
                    DataCell(Center(child: Text("2"))),
                    DataCell(Center(child: Text("70"))),
                    DataCell(Center(child: Text("pass"))),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
