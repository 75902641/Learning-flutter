import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/BasicControl/BUTTON/ButtonBasicUsage.dart';
import 'package:flutter_app/BasicControl/IMAGEDEMO/ImageBasicUsage.dart';
import 'package:flutter_app/BasicControl/ProgressIndicator/ProgressIndicators.dart';
import 'package:flutter_app/BasicControl/TEXT/BasicTextUsage.dart';
import 'package:flutter_app/ContainerClassWidget/Clip/ClipClass.dart';
import 'package:flutter_app/ContainerClassWidget/Container/ContainerClass.dart';
import 'package:flutter_app/ContainerClassWidget/DecorativeContainer/DecorativeContainer.dart';
import 'package:flutter_app/ContainerClassWidget/Padding/PaddingClass.dart';
import 'package:flutter_app/ContainerClassWidget/ScaffoldTabBar/ScaffoldTabBarClass.dart';
import 'package:flutter_app/ContainerClassWidget/SizeLimitClassContainer/SizeLimitClassContainer.dart';
import 'package:flutter_app/ContainerClassWidget/Transform/TransformClass.dart';
import 'package:flutter_app/IntroductionToFunctionalWidgets/NavigationReturnInterception/NavigationReturnInterception.dart';
import 'package:flutter_app/LayoutClassComponent/AlignmentAndRelativePositioning/AlignmentAndRelativePositioning.dart';
import 'package:flutter_app/LayoutClassComponent/CascadingLayout/CascadingLayout.dart';
import 'package:flutter_app/LayoutClassComponent/FlexibleLayout/FlexibleLayout.dart';
import 'package:flutter_app/LayoutClassComponent/IntroductionToLayoutClassComponents/IntroductionToLayoutClassComponents.dart';
import 'package:flutter_app/LayoutClassComponent/LinearLayout/LinearLayoutRowColumn.dart';
import 'package:flutter_app/LayoutClassComponent/StreamingLayout/StreamingLayout.dart';
import 'package:flutter_app/ScrollableComponent/CustomScrollView/CustomScrollViewClass.dart';
import 'package:flutter_app/ScrollableComponent/GridView/GridViewClass.dart';
import 'package:flutter_app/ScrollableComponent/IntroductionToScrollableComponents/IntroductionToScrollableComponents.dart';
import 'package:flutter_app/ScrollableComponent/ListView/ListViewClass.dart';
import 'package:flutter_app/ScrollableComponent/RollingMonitoringAndControl/RollingMonitoringAndControl.dart';
import 'package:flutter_app/ScrollableComponent/SingleChildScrollView/SingleChildScrollViewClass.dart';
import 'BasicControl/InputBoxAndForm/InputBoxAndForm.dart';
import 'BasicControl/RadioSwitchAndCheckBox/RadioSwitchAndCheckBox.dart';

class GettingStarted extends StatefulWidget {
  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
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
        if (titleItem == "文本、字体样式") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BasicTextUsage();
          }));
        } else if (titleItem == "按钮") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ButtonBasicUsage();
          }));
        } else if (titleItem == "图片") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ImageBasicUsage();
          }));
        } else if (titleItem == '单选开关和复选框') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RadioSwitchAndCheckBox();
          }));
        } else if (titleItem == '输入框和表单') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return InputBoxAndForm();
          }));
        } else if (titleItem == '进度指示器') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProgressIndicators();
          }));
        } else if (titleItem == '布局类组件简介') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return IntroductionToLayoutClassComponents();
          }));
        } else if (titleItem == '线性布局') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LinearLayoutRowColumn();
          }));
        } else if (titleItem == '弹性布局') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FlexibleLayout();
          }));
        } else if (titleItem == '流式布局') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return StreamingLayout();
          }));
        } else if (titleItem == '层叠布局') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CascadingLayout();
          }));
        } else if (titleItem == '对齐与相对定位') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AlignmentAndRelativePositioning();
          }));
        } else if (titleItem == '填充') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PaddingClass();
          }));
        } else if (titleItem == '尺寸限制类容器') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SizeLimitClassContainer();
          }));
        } else if (titleItem == '装饰容器DecoratedBox') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DecorativeContainer();
          }));
        } else if (titleItem == '变换') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransformClass();
          }));
        } else if (titleItem == 'Container') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContainerClass();
          }));
        } else if (titleItem == 'Scaffold、TabBar、底部导航') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ScaffoldTabBarClass();
          }));
        } else if (titleItem == '剪裁') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ClipClass();
          }));
        } else if (titleItem == '可滚动组件简介') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return IntroductionToScrollableComponents();
          }));
        } else if (titleItem == 'SingleChildScrollView') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SingleChildScrollViewClass();
          }));
        } else if (titleItem == 'ListView') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ListViewClass();
          }));
        } else if (titleItem == 'GridView') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GridViewClass();
          }));
        } else if (titleItem == 'CustomScrollView') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CustomScrollViewClass();
          }));
        } else if (titleItem == '滚动监听及控制') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RollingMonitoringAndControl();
          }));
        } else if (titleItem == '导航返回拦截') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NavigationReturnInterception();
          }));
        }
      },
    );
  }

  // 数据源
  List<String> titleItems = <String>[
    '文本、字体样式',
    '按钮',
    '图片',
    '单选开关和复选框',
    '输入框和表单',
    '进度指示器',
    '布局类组件简介',
    '线性布局',
    '弹性布局',
    '流式布局',
    '层叠布局',
    '对齐与相对定位',
    '填充',
    '尺寸限制类容器',
    '装饰容器DecoratedBox',
    '变换',
    'Container',
    'Scaffold、TabBar、底部导航',
    '剪裁',
    '可滚动组件简介',
    'SingleChildScrollView',
    'ListView',
    'GridView',
    'CustomScrollView',
    '滚动监听及控制',
    '导航返回拦截',
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard),
    new Icon(Icons.radio_button_checked),
    new Icon(Icons.router),
    new Icon(Icons.pages),
    new Icon(Icons.radio_button_unchecked),
    new Icon(Icons.slideshow),
    new Icon(Icons.slideshow),
    new Icon(Icons.zoom_out_map),
    new Icon(Icons.zoom_out),
    new Icon(Icons.youtube_searched_for),
    new Icon(Icons.wifi_tethering),
    new Icon(Icons.wifi_lock),
    new Icon(Icons.widgets),
    new Icon(Icons.weekend),
    new Icon(Icons.web),
    new Icon(Icons.accessible),
    new Icon(Icons.ac_unit),
    new Icon(Icons.keyboard),
    new Icon(Icons.radio_button_checked),
    new Icon(Icons.router),
    new Icon(Icons.pages),
    new Icon(Icons.radio_button_unchecked),
    new Icon(Icons.slideshow),
    new Icon(Icons.zoom_out_map),
    new Icon(Icons.zoom_out),
    new Icon(Icons.youtube_searched_for),
  ];

  List<String> subTitleItems = <String>[
    'subTitle: 文本的基本使用',
    'subTitle: 按钮的基本使用',
    'subTitle: 图片和ICON',
    'subTitle: 单选开关和复选框',
    'subTitle: 输入框及表单',
    'subTitle: 进度指示器',
    'subTitle: 布局类组件简介',
    'subTitle: 线性布局（Row和Column）',
    'subTitle: 弹性布局（Flex）',
    'subTitle: 流式布局（Wrap、Flow）',
    'subTitle: 层叠布局（Stack、Positioned）',
    'subTitle: 对齐与相对定位（Align）',
    'subTitle: 填充（Padding）',
    'subTitle: 尺寸限制类容器',
    'subTitle: 装饰容器DecoratedBox',
    'subTitle: 变换（Transform）',
    'subTitle: Container容器',
    'subTitle: Scaffold、TabBar、底部导航',
    'subTitle: 剪裁（Clip）',
    'subTitle: 可滚动组件简介',
    'subTitle: SingleChildScrollView',
    'subTitle: ListView',
    'subTitle: GridView',
    'subTitle: CustomScrollView',
    'subTitle: 滚动监听及控制',
    'subTitle: 导航返回拦截（WillPopScope）',
  ];
}
