import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvancedArticle extends StatefulWidget {
  @override
  _AdvancedArticleState createState() => _AdvancedArticleState();
}

class _AdvancedArticleState extends State<AdvancedArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('尽情期待', style: TextStyle(fontSize: 20.0),),
      ),
    );
  }
}