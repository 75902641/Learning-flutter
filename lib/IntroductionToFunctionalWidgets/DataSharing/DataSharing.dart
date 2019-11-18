import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataSharing extends StatefulWidget {
  @override
  _DataSharingState createState() => _DataSharingState();
}

class _DataSharingState extends State<DataSharing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据共享（InheritedWidget）'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'InheritedWidget是Flutter中非常重要的一个功能型组件，它提供了一种数据在widget树中从上到下传递、共享的方式，比如我们在应用的根widget中通过InheritedWidget共享了一个数据，那么我们便可以在任意子widget中来获取该共享的数据！这个特性在一些需要在widget树中共享数据的场景中非常方便！如Flutter SDK中正是通过InheritedWidget来共享应用主题（Theme）和Locale (当前语言环境)信息的。\n\nInheritedWidget和React中的context功能类似，和逐级传递数据相比，它们能实现组件跨级传递数据。InheritedWidget的在widget树中数据传递方向是从上到下的，这和通知Notification（将在下一章中介绍）的传递方向正好相反。\n'),
              Text(
                'didChangeDependencies\n',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                  '在之前介绍StatefulWidget时，我们提到State对象有一个didChangeDependencies回调，它会在“依赖”发生变化时被Flutter Framework调用。而这个“依赖”指的就是子widget是否使用了父widget中InheritedWidget的数据！如果使用了，则代表子widget依赖有依赖InheritedWidget；如果没有使用则代表没有依赖。这种机制可以使子组件在所依赖的InheritedWidget变化时来更新自身！比如当主题、locale(语言)等发生变化时，依赖其的子widget的didChangeDependencies方法将会被调用。\n\n下面我们看一下之前“计数器”示例应用程序的InheritedWidget版本。需要说明的是，本示例主要是为了演示InheritedWidget的功能特性，并不是计数器的推荐实现方式。\n\n首先，我们通过继承InheritedWidget，将当前计数器点击次数保存在ShareDataWidget的data属性中：\n\nclass ShareDataWidget extends InheritedWidget {\n  ShareDataWidget({\n    @required this.data,\n    Widget child\n  }) :super(child: child);\n\n  final int data; //需要在子树中共享的数据，保存点击次数\n\n  //定义一个便捷方法，方便子树中的widget获取共享数据  \n  static ShareDataWidget of(BuildContext context) {\n    return context.inheritFromWidgetOfExactType(ShareDataWidget);\n  }\n\n  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget  \n  @override\n  bool updateShouldNotify(ShareDataWidget old) {\n    //如果返回true，则子树中依赖(build函数中有调用)本widget\n    //的子widget的`state.didChangeDependencies`会被调用\n    return old.data != data;\n  }\n}\n\n然后我们实现一个子组件_TestWidget，在其build方法中引用ShareDataWidget中的数据。同时，在其didChangeDependencies() 回调中打印日志：\n\nclass _TestWidget extends StatefulWidget {\n  @override\n  __TestWidgetState createState() => new __TestWidgetState();\n}\n\nclass __TestWidgetState extends State<_TestWidget> {\n  @override\n  Widget build(BuildContext context) {\n    //使用InheritedWidget中的共享数据\n    return Text(ShareDataWidget\n        .of(context)\n        .data\n        .toString());\n  }\n\n  @override\n  void didChangeDependencies() {\n    super.didChangeDependencies();\n    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。\n    //如果build中没有依赖InheritedWidget，则此回调不会被调用。\n    print("Dependencies change");\n  }\n}\n\n最后，我们创建一个按钮，每点击一次，就将ShareDataWidget的值自增：\n\nclass InheritedWidgetTestRoute extends StatefulWidget {\n  @override\n  _InheritedWidgetTestRouteState createState() => new _InheritedWidgetTestRouteState();\n}\n\nclass _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {\n  int count = 0;\n\n  @override\n  Widget build(BuildContext context) {\n    return  Center(\n      child: ShareDataWidget( //使用ShareDataWidget\n        data: count,\n        child: Column(\n          mainAxisAlignment: MainAxisAlignment.center,\n          children: <Widget>[\n            Padding(\n              padding: const EdgeInsets.only(bottom: 20.0),\n              child: _TestWidget(),//子widget中依赖ShareDataWidget\n            ),\n            RaisedButton(\n              child: Text("Increment"),\n              //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新  \n              onPressed: () => setState(() => ++count),\n            )\n          ],\n        ),\n      ),\n    );\n  }\n}\n\n运行后界面如图\n'),
              Image.network(
                'https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/7-1.png',
                width: 200,
              ),
              Text(
                  '\n每点击一次按钮，计数器就会自增，控制台就会打印一句日志：\n\nI/flutter ( 8513): Dependencies change\n\n可见依赖发生变化后，其didChangeDependencies()会被调用。但是读者要注意，如果_TestWidget的build方法中没有使用ShareDataWidget的数据，那么它的didChangeDependencies()将不会被调用，因为它并没有依赖ShareDataWidget。例如，我们将__TestWidgetState代码该为下面这样，didChangeDependencies()将不会被调用:\n\nclass __TestWidgetState extends State<_TestWidget> {\n  @override\n  Widget build(BuildContext context) {\n    // 使用InheritedWidget中的共享数据\n    //    return Text(ShareDataWidget\n    //        .of(context)\n    //        .data\n    //        .toString());\n     return Text("text");\n  }\n\n  @override\n  void didChangeDependencies() {\n    super.didChangeDependencies();\n    // build方法中没有依赖InheritedWidget，此回调不会被调用。\n    print("Dependencies change");\n  }\n}\n\n上面的代码中，我们将build()方法中依赖ShareDataWidget的代码注释掉了，然后返回一个固定Text，这样一来，当点击Increment按钮后，ShareDataWidget的data虽然发生变化，但由于__TestWidgetState并未依赖ShareDataWidget，所以__TestWidgetState的didChangeDependencies方法不会被调用。其实，这个机制很好理解，因为在数据发生变化时只对使用该数据的Widget更新是合理并且性能友好的。\n'),
              Text(
                '应该在didChangeDependencies()中做什么？\n',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                  '一般来说，子widget很少会重写此方法，因为在依赖改变后framework也都会调用build()方法。但是，如果你需要在依赖改变后执行一些昂贵的操作，比如网络请求，这时最好的方式就是在此方法中执行，这样可以避免每次build()都执行这些昂贵操作。\n'),
              Text(
                '深入了解InheritedWidget\n',
                style: TextStyle(fontSize: 20),
              ),
              Text('现在来思考一下，如果我们只想在__TestWidgetState中引用ShareDataWidget数据，但却不希望在ShareDataWidget发生变化时调用__TestWidgetState的didChangeDependencies()方法应该怎么办？其实答案很简单，我们只需要将ShareDataWidget.of()的实现改一下即可：\n\n//定义一个便捷方法，方便子树中的widget获取共享数据\nstatic ShareDataWidget of(BuildContext context) {\n  //return context.inheritFromWidgetOfExactType(ShareDataWidget);\n  return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;\n}\n\n唯一的改动就是获取ShareDataWidget对象的方式，把inheritFromWidgetOfExactType()方法换成了context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget，那么他们到底有什么区别呢，我们看一下这两个方法的源码（实现代码在Element类中，Context和Element的关系我们将在后面专门介绍）：\n\n@override\nInheritedElement ancestorInheritedElementForWidgetOfExactType(Type targetType) {\n  final InheritedElement ancestor = _inheritedWidgets == null ? null :  _inheritedWidgets[targetType];\n  return ancestor;\n}\n\n@override\nInheritedWidget inheritFromWidgetOfExactType(Type targetType, { Object aspect }) {\n  final InheritedElement ancestor = _inheritedWidgets == null ? null :   _inheritedWidgets[targetType];\n  //多出的部分\n  if (ancestor != null) {\n    assert(ancestor is InheritedElement);\n    return inheritFromElement(ancestor, aspect: aspect);\n  }\n  _hadUnsatisfiedDependencies = true;\n  return null;\n}\n\n我们可以看到，inheritFromWidgetOfExactType() 比 ancestorInheritedElementForWidgetOfExactType()多调了inheritFromElement方法，inheritFromElement源码如下：\n\n@override\nInheritedWidget inheritFromElement(InheritedElement ancestor, { Object aspect }) {\n  //注册依赖关系\n  _dependencies ??= HashSet<InheritedElement>();\n  _dependencies.add(ancestor);\n  ancestor.updateDependencies(this, aspect);\n  return ancestor.widget;\n}\n\n可以看到inheritFromElement方法中主要是注册了依赖关系！看到这里也就清晰了，调用inheritFromWidgetOfExactType() 和 ancestorInheritedElementForWidgetOfExactType()的区别就是前者会注册依赖关系，而后者不会，所以在调用inheritFromWidgetOfExactType()时，InheritedWidget和依赖它的子孙组件关系便完成了注册，之后当InheritedWidget发生变化时，就会更新依赖它的子孙组件，也就是会调这些子孙组件的didChangeDependencies()方法和build()方法。而当调用的是 ancestorInheritedElementForWidgetOfExactType()时，由于没有注册依赖关系，所以之后当InheritedWidget发生变化时，就不会更新相应的子孙Widget。\n\n注意，如果将上面示例中ShareDataWidget.of()方法实现改成调用ancestorInheritedElementForWidgetOfExactType()，运行示例后，点击"Increment"按钮，会发现__TestWidgetState的didChangeDependencies()方法确实不会再被调用，但是其build()仍然会被调用！造成这个的原因其实是，点击"Increment"按钮后，会调用_InheritedWidgetTestRouteState的setState()方法，此时会重新构建整个页面，由于示例中，__TestWidget 并没有任何缓存，所以它也都会被重新构建，所以也会调用build()方法。\n\n那么，现在就带来了一个问题：实际上，我们只想更新子树中依赖了ShareDataWidget的组件，而现在只要调用_InheritedWidgetTestRouteState的setState()方法，所有子节点都会被重新build，这很没必要，那么有什么办法可以避免呢？答案是缓存！一个简单的做法就是通过封装一个StatefulWidget，将子Widget树缓存起来，具体做法下一节我们将通过实现一个Provider Widget 来演示如何缓存，以及如何利用InheritedWidget 来实现Flutter全局状态共享。\n\n\n\n'),

            ],
          ),
        ),
      ),
    );
  }
}
