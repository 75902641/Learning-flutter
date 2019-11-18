import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationReturnInterception extends StatefulWidget {
  @override
  _NavigationReturnInterceptionState createState() => _NavigationReturnInterceptionState();
}

class _NavigationReturnInterceptionState extends State<NavigationReturnInterception> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('导航返回拦截（WillPopScope）'),),
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