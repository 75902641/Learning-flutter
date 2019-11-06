import 'package:flutter/material.dart';

class BasicTextUsage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本的基本使用'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("展示的内容就是代码的内容，此处只展示部分属性，其他属性请翻译文档\n"),
              Text('Text\n', style: TextStyle(fontSize: 20.0),),
              Text(
                  'textAlign：文本的对齐方式；可以选择左对齐、右对齐还是居中。注意，对齐的参考系是Text widget本身。本例中虽然是指定了居中对齐，但因为Text文本内容宽度不足一行，Text的宽度和文本内容长度相等，那么这时指定对齐方式是没有意义的，只有Text宽度大于文本内容长度时指定此属性才有意义。\n'),
              Text(
                'Text:("Hello world",textAlign: TextAlign.left,);\n',
                textAlign: TextAlign.left,
              ),
              Text('下面我们指定一个较长的字符串居中显示：\n'),
              Text(
                'Text("Hello world "*6, textAlign: TextAlign.center,)；' * 2,
                textAlign: TextAlign.center,
              ),
              Text(
                  '\nmaxLines、overflow：指定文本显示的最大行数，默认情况下，文本是自动折行的，如果指定此参数，则文本最多不会超过指定的行。如果有多余的文本，可以通过overflow来指定截断方式，默认是直接截断，本例中指定的截断方式TextOverflow.ellipsis，它会将多余文本截断后以省略符“...”表示；'),
              Text(
                  'textScaleFactor：代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性的fontSize，它是调整字体大小的一个快捷方式。该属性的默认值可以通过MediaQueryData.textScaleFactor获得，如果没有MediaQuery，那么会默认值将为1.0。\n'),
              Text(
                'Text("Hello world! I\'m Jack. "*4,maxLines: 1,overflow: TextOverflow.ellipsis,);' *
                    4,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Hello world",
                textScaleFactor: 1.5,
              ),
              Text('\nTextStyle\n', style: TextStyle(fontSize: 20.0),),
              Text('TextStyle用于指定文本显示的样式如颜色、字体、粗细、背景等。我们看一个示例：\n'),
              Text(
                'Text("Hello world",\nstyle: TextStyle(\ncolor: Colors.blue,\nfontSize: 18.0,\nheight: 1.2, \nfontFamily: "Courier",\nbackground: new Paint()..color=Colors.yellow,\ndecoration:TextDecoration.underline,\ndecorationStyle: TextDecorationStyle.dashed\n),\n);',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: new Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              Text('\nTextSpan\n', style: TextStyle(fontSize: 20.0),),
              Text('在上面的例子中，Text的所有文本内容只能按同一种样式，如果我们需要对一个Text内容的不同部分按照不同的样式显示，这时就可以使用TextSpan，它代表文本的一个“片段”。我们看看TextSpan的定义:\n'),
              Text('const TextSpan({\nTextStyle style,\nSting text,\nList<TextSpan> children,\nGestureRecognizer recognizer,\n});\n'),
              Text('其中style 和 text属性代表该文本片段的样式和内容。 children是一个TextSpan的数组，也就是说TextSpan可以包括其他TextSpan。而recognizer用于对该文本片段上用于手势进行识别处理。\n'),
              Text('代码如下:\nText.rich(TextSpan(\nchildren: [\nTextSpan(\ntext: "Home: "\n),\nTextSpan(\ntext: "https://flutterchina.club",\nstyle: TextStyle(\ncolor: Colors.blue\n), \nrecognizer: _tapRecognizer\n),\n ]\n))\n'),
              Text('效果如下：'),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: "home:"
                  ),
                  TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(
                      color: Colors.blue
                    ),
                    // recognizer: _tapRecognizer
                  )
              ])),
              Text('\nDefaultTextStyle\n', style: TextStyle(fontSize: 20.0),),
              Text('在Widget树中，文本的样式默认是可以被继承的（子类文本类组件未指定具体样式时可以使用Widget树中父级设置的默认样式），因此，如果在Widget树的某一个节点处设置一个默认的文本样式，那么该节点的子树中所有文本都会默认使用这个样式，而DefaultTextStyle正是用于设置默认文本样式的。下面我们看一个例子：\n'),
              Text('DefaultTextStyle(\n//1.设置文本默认样式  \nstyle: TextStyle(\ncolor:Colors.red,\nfontSize: 20.0,\n),\ntextAlign: TextAlign.start,\nchild: Column(\ncrossAxisAlignment: CrossAxisAlignment.start,\nchildren: <Widget>[\nText("hello world"),\next("I am Jack"),\nText("I am Jack",\nstyle: TextStyle(\ninherit: false, //2.不继承默认样式\ncolor: Colors.grey\n),\n),\n],\n ),\n);\n'),
              Text('上面代码中，我们首先设置了一个默认的文本样式，即字体为20像素(逻辑像素)、颜色为红色。然后通过DefaultTextStyle 设置给了子树Column节点处，这样一来Column的所有子孙Text默认都会继承该样式，除非Text显示指定不继承样式，如代码中注释2。运行效果如下'),
              DefaultTextStyle(
                //1.设置文本默认样式  
                style: TextStyle(
                  fontSize: 20.0,
                   color: Colors.red
                   ),
                   textAlign: TextAlign.start,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Text('hello word'),
                       Text('I am Jack'),
                       Text('I an Jack',
                        style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey
                        ),
                       )
                     ],
                   ),
              ),
              Text('\n字体后面单独拿出来做demo',
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
