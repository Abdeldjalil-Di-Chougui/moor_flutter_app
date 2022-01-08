import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

import '../../data/moor_database.dart';

class NewTaskInput extends StatefulWidget {
  const NewTaskInput({
    Key key,
  }) : super(key: key);

  @override
  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  DateTime newTaskDate;
  Tag selectedTag;
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildTextField(context),
          _buildTagSelector(context),
          _buildDateButton(context),
        ],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Task Name'),
        onSubmitted: (inputName) {
          final dao = Provider.of<TaskDao>(context);
          final task = TasksCompanion(
            name: Value(inputName),
            dueDate: Value(newTaskDate),
            tagName: Value(selectedTag?.name),
          );
          dao.insertTask(task);
          resetValuesAfterSubmit();
        },
      ),
    );
  }
}