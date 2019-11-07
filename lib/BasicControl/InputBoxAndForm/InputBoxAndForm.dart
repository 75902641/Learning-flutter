import 'package:flutter/material.dart';

class InputBoxAndForm extends StatefulWidget {
  @override
  _InputBoxAndFormState createState() => _InputBoxAndFormState();
}

class _InputBoxAndFormState extends State<InputBoxAndForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('输入框和表单'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('TextField\n', style: TextStyle(fontSize: 20.0),),
              Text('TextField用于文本输入，它提供了很多属性，我们先简单介绍一下主要属性的作用，然后通过几个示例来演示一下关键属性的用法。\n\nconst TextField({\n  ...\n  TextEditingController controller, \n  FocusNode focusNode,\n  InputDecoration decoration = const InputDecoration(),\n  TextInputType keyboardType,\n  TextInputAction textInputAction,\n  TextStyle style,\n  TextAlign textAlign = TextAlign.start,\n  bool autofocus = false,\n  bool obscureText = false,\n  int maxLines = 1,\n  int maxLength,\n  bool maxLengthEnforced = true,\n  ValueChanged<String> onChanged,\n  VoidCallback onEditingComplete,\n  ValueChanged<String> onSubmitted,\n  List<TextInputFormatter> inputFormatters,\n  bool enabled,\n  this.cursorWidth = 2.0,\n  this.cursorRadius,\n  this.cursorColor,\n  ...\n})\n\n'),
            ],
          ),
        ),
      ),
    );
  }
}