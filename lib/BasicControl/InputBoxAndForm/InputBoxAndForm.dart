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
              
            ],
          ),
        ),
      ),
    );
  }
}