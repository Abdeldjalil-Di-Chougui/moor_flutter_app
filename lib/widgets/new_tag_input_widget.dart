import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

class NewTagInput extends StatefulWidget {
  const NewTagInput({
    Key key,
  }) : super(key: key);

  @override
  _NewTagInputState createState() => _NewTagInputState();
}

class _NewTagInputState extends State<NewTagInput> {
  static const Color DEFAULT_COLOR = Colors.red;

  Color pickedTagColor = DEFAULT_COLOR;
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
        children: <Widget>[
          _buildTextField(context),
          _buildColorPickerButton(context),
        ],
      ),
    );
  }
}