import 'package:flutter/cupertino.dart';
import 'package:flutter_app/IntroductionToFunctionalWidgets/DataSharing/ShareDataWidget.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      ShareDataWidget.of(context).data.toString()
    );
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print('Dependencies change');
  }
}