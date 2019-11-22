import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Animation/IntroductionToFlutterAnimation/IntroductionToFlutterAnimation.dart';
import 'package:flutter_app/BasicControl/TEXT/BasicTextUsage.dart';

class AdvancedArticle extends StatefulWidget {
  @override
  _AdvancedArticleState createState() => _AdvancedArticleState();
}

class _AdvancedArticleState extends State<AdvancedArticle> {
  var aaaa = '尽情期待';
  @override
  Widget build(BuildContext context) {

    List<Widget> _list = new List();
    for (int i = 0; i < titleItems.length; i++) {
      _list.add(buildListData(
          context, titleItems[i], iconItems[i], subTitleItems[i]));
    }

    return new Scaffold(
      body: new Scrollbar(
        // ListView.separated写法
        child: new ListView.separated(
            itemBuilder: (context, item) {
              return buildListData(context, titleItems[item], iconItems[item],
                  subTitleItems[item]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                new Divider(),
            itemCount: titleItems.length),
            
            
      ),
    );
  }

  Widget buildListData(BuildContext context, String titleItem, Icon iconItem,
      String subTitleItem) {
    return new ListTile(
      leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: new Text(
        subTitleItem,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        if (titleItem == "Flutter动画简介") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return IntroductionToFlutterAnimation();
          }));
        } 
      },
    );
  }

  // 数据源
  List<String> titleItems = <String>[
    'Flutter动画简介',
    
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard),
    new Icon(Icons.radio_button_checked),
    // new Icon(Icons.router),
    // new Icon(Icons.pages),
    // new Icon(Icons.radio_button_unchecked),
    // new Icon(Icons.slideshow),
    // new Icon(Icons.slideshow),
    // new Icon(Icons.zoom_out_map),
    // new Icon(Icons.zoom_out),
    // new Icon(Icons.youtube_searched_for),
    // new Icon(Icons.wifi_tethering),
    // new Icon(Icons.wifi_lock),
    // new Icon(Icons.widgets),
    // new Icon(Icons.weekend),
    // new Icon(Icons.web),
    // new Icon(Icons.accessible),
    // new Icon(Icons.ac_unit),
    // new Icon(Icons.keyboard),
    // new Icon(Icons.radio_button_checked),
    // new Icon(Icons.router),
    // new Icon(Icons.pages),
    // new Icon(Icons.radio_button_unchecked),
    // new Icon(Icons.slideshow),
    // new Icon(Icons.zoom_out_map),
    // new Icon(Icons.zoom_out),
    // new Icon(Icons.youtube_searched_for),
    // new Icon(Icons.wifi_tethering),
    // new Icon(Icons.wifi_lock),
    // new Icon(Icons.widgets),
    // new Icon(Icons.weekend),
  ];

  List<String> subTitleItems = <String>[
    'subTitle: Flutter动画简介',
    
  ];
}