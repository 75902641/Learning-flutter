import 'package:flutter/material.dart';
import 'package:flutter_app/BasicControl/IMAGEDEMO/ImageAndIconRoute.dart';

class ImageBasicUsage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
    return Scaffold(
      appBar: AppBar(
        title: Text('图片的基本用法'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '图片\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'Flutter中，我们可以通过Image组件来加载并显示图片，Image的数据源可以是asset、文件、内存以及网络。\n'),
              Text(
                'ImageProvider\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'ImageProvider 是一个抽象类，主要定义了图片数据获取的接口load()，从不同的数据源获取图片需要实现不同的ImageProvider ，如AssetImage是实现了从Asset中加载图片的ImageProvider，而NetworkImage实现了从网络加载图片的ImageProvider。\n'),
              Text(
                'Image\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'Image widget有一个必选的image参数，它对应一个ImageProvider。下面我们分别演示一下如何从asset和网络加载图片。\n'),
              Text(
                '从asset中加载图片\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '1.在工程根目录下创建一个images目录，并将图片avatar.png拷贝到该目录。\n2.在pubspec.yaml中的flutter部分添加如下内容：\n assets:\n  - images/avatar.png\n注意: 由于 yaml 文件对缩进严格，所以必须严格按照每一层两个空格的方式进行缩进，此处assets前面应有两个空格。\n3.加载该图片\nImage(\nimage: AssetImage("images/avatar.png"),\nwidth: 100.0\n);\nImage也提供了一个快捷的构造函数Image.asset用于从asset中加载、显示图片：\nImage.asset("images/avatar.png",\nwidth: 100.0,\n)\n'),
              Text(
                '从网络加载图片\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'Image(\n  image: NetworkImage(\n      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),\n  width: 100.0,\n)\nImage也提供了一个快捷的构造函数Image.network用于从网络加载、显示图片：\nImage.network(\n"https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",\nwidth: 100.0,\n)\n运行上面两个示例，图片加载成功后如下\n'),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
              ),
              Text(
                '\n参数\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'Image在显示图片时定义了一系列参数，通过这些参数我们可以控制图片的显示外观、大小、混合效果等。我们看一下Image的主要参数：\nconst Image({\n  ...\n  this.width, //图片的宽\n  this.height, //图片高度\n  this.color, //图片的混合色值\n  this.colorBlendMode, //混合模式\n  this.fit,//缩放模式\n  this.alignment = Alignment.center, //对齐方式\n  this.repeat = ImageRepeat.noRepeat, //重复方式\n  ...\n})\nwidth、height：用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的fit属性来指定适应规则。\n\nfit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：\n       fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。\n      cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。\n      contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。\n      fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。\n      fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。\n      none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。\n\n一图胜万言！ 我们对一个宽高相同的头像图片应用不同的fit值，效果如图'),
              Image.network(
                "https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/3-18.png",
                width: 200,
              ),
              Text(
                  '\ncolor和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，color指定混合色，而colorBlendMode指定混合模式，下面是一个简单的示例：\nImage(\n  image: AssetImage("images/avatar.png"),\n  width: 100.0,\n  color: Colors.blue,\n  colorBlendMode: BlendMode.difference,\n);\n运行效果如图'),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
              ),
              Text(
                  '\n      repeat：当图片本身大小小于显示空间时，指定图片的重复规则。简单示例如下：\n      Image(\n        image: AssetImage("images/avatar.png"),\n        width: 100.0,\n        height: 200.0,\n        repeat: ImageRepeat.repeatY ,\n      )\n      运行后效果如下'),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY,
              ),
              Text('\n完整代码请到demo里查看,点击下面按钮查看效果\n'),
              RaisedButton(
                child: Text('查看效果'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImageAndIconRoute();
                  }));
                },
              ),
              Text(
                '\nImage缓存\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'Flutter框架对加载过的图片是有缓存的（内存），默认最大缓存数量是1000，最大缓存空间为100M。关于Image的详细内容及原理我们将会在后面进阶部分深入介绍。\n'),
              Text(
                '\nICON\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'Flutter中，可以像Web开发一样使用iconfont，iconfont即“字体图标”，它是将图标做成字体文件，然后通过指定不同的字符而显示不同的图片。\n在字体��件中，每一个字符都对应一个位码，而每一个位码对应一个显示字形，不同的字体就是指字形不同，即字符对应的字形是不同的。而在iconfont中，只是将位码对应的字形做成了图标，所以不同的字符最终就会渲染成不同的图标。\n在Flutter开发中，iconfont和图片相比有如下优势：\n1.体积小：可以减小安装包大小。\n2.矢量的：iconfont都是矢量图标，放大不会影响其清晰度。\n3.可以应用文本样式：可以像文本一样改变字体图标的颜色、大小对齐等。\n4.可以通过TextSpan和文本混用。\n'),
              Text(
                '\n使用Material Design字体图标\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'Flutter默认包含了一套Material Design的字体图标，在pubspec.yaml文件中的配置如下\nflutter:\n  uses-material-design: true\nMaterial Design所有图标可以在其官网查看：https://material.io/tools/icons/\n我们看一个简单的例子：\nString icons = "";\n// accessible: &#xE914; or 0xE914 or E914\nicons += "\uE914";\n// error: &#xE000; or 0xE000 or E000\nicons += " \uE000";\n// fingerprint: &#xE90D; or 0xE90D or E90D\nicons += " \uE90D";\n\nText(icons,\n  style: TextStyle(\n      fontFamily: "MaterialIcons",\n      fontSize: 24.0,\n      color: Colors.green\n  ),\n);\n运行效果如下：\n'),
                  Text(icons,
                    style: TextStyle(
                      fontFamily: 'MaterialIcons',
                      fontSize: 20.0,
                      color: Colors.green
                    ),
                  ),
                  Text('通过这个示例可以看到，使用图标就像使用文本一样，但是这种方式需要我们提供每个图标的码点，这并对开发者不友好，所以，Flutter封装了IconData和Icon来专门显示字体图标，上面的例子也可以用如下方式实现：\nRow(\n  mainAxisAlignment: MainAxisAlignment.center,\n  children: <Widget>[\n    Icon(Icons.accessible,color: Colors.green,),\n    Icon(Icons.error,color: Colors.green,),\n    Icon(Icons.fingerprint,color: Colors.green,),\n  ],\n)\nIcons类中包含了所有Material Design图标的IconData静态变量定义。\n'),
                  Text('\n使用自定义字体图标\n', style: TextStyle(fontSize: 20.0),),
                  Text('我们也可以使用自定义字体图标。iconfont.cn上有很多字体图标素材，我们可以选择自己需要的图标打包下载后，会生成一些不同格式的字体文件，在Flutter中，我们使用ttf格式即可。\n假设我们项目中需要使用一个书籍图标和微信图标，我们打包下载后导入：\n1.导入字体图标文件；这一步和导入字体文件相同，假设我们的字体图标文件保存在项目根目录下，路径为"fonts/iconfont.ttf"：\nfonts:\n  - family: myIcon  #指定一个字体名\n    fonts:\n      - asset: fonts/iconfont.ttf\n2.为了使用方便，我们定义一个MyIcons类，功能和Icons类一样：将字体文件中的所有图标都定义成静态变量：\nclass MyIcons{\n  // book 图标\n  static const IconData book = const IconData(\n      0xe614, \n      fontFamily: "myIcon", \n      matchTextDirection: true\n  );\n  // 微信图标\n  static const IconData wechat = const IconData(\n      0xec7d,  \n      fontFamily: "myIcon", \n      matchTextDirection: true\n  );\n}\n3.使用\nRow(\n  mainAxisAlignment: MainAxisAlignment.center,\n  children: <Widget>[\n    Icon(MyIcons.book,color: Colors.purple,),\n    Icon(MyIcons.wechat,color: Colors.green,),\n  ],\n)\n'),

            ],
          ),
        ),
      ),
    );
  }
}
