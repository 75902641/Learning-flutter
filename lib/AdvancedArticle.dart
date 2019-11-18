import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvancedArticle extends StatefulWidget {
  @override
  _AdvancedArticleState createState() => _AdvancedArticleState();
}

class _AdvancedArticleState extends State<AdvancedArticle> {
  var aaaa = '尽情期待';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('$aaaa', style: TextStyle(fontSize: 20.0),),
            RaisedButton(
              child: Text('改变内容'),
              onPressed: (){
                setState(() {
                  aaaa = '马上更新';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}