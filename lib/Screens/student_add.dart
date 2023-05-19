import 'package:flutter/material.dart';
import '../Student.dart';
import 'package:denemeaaa/main.dart';
class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(this.students);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

var formKey = GlobalKey<FormState>();
Student student = Student("", "", 0);

class _StudentAddState extends State<StudentAdd> {
  @override
  Widget build(BuildContext context) {
    List<Student> students;
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSumbitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci Adı", hintText: "Adınızı Giriniz"),
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }
}

buildLastNameField() {
  return TextFormField(
    decoration: InputDecoration(
        labelText: "Öğrenci Soyadı", hintText: "Soyadınızı Giriniz"),
    onSaved: (String? value) {
      student.lastName = value!;
    },
  );
}

buildGradeField() {
  return TextFormField(
    decoration:
        InputDecoration(labelText: "Öğrenci Not", hintText: "Notunuzu Giriniz"),
    onSaved: (String? value) {
      student.grade = int.parse(value!)!;
    },
  );
}

Widget buildSumbitButton() {
  return ElevatedButton(
    child: Text("Kaydet"),
    onPressed: () {
      formKey.currentState?.save();
     students.add(student);
    },
  );
}
