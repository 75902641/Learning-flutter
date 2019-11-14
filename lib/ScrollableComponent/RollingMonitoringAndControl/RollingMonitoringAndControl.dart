import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RollingMonitoringAndControl extends StatefulWidget {
  @override
  _RollingMonitoringAndControlState createState() => _RollingMonitoringAndControlState();
}

class _RollingMonitoringAndControlState extends State<RollingMonitoringAndControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('滚动监听及控制'),),
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