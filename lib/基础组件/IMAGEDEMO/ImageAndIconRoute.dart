import 'package:flutter/material.dart';

class ImageAndIconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('示例'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Image>[
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  height: 50.0,
                  width: 100.0,
                  fit: BoxFit.fill,
                ),
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  height: 50,
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100.0,
                  height: 50.0,
                  fit: BoxFit.fitWidth,
                ),
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100.0,
                  height: 50.0,
                  fit: BoxFit.fitHeight,
                ),
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100.0,
                  height: 50.0,
                  fit: BoxFit.scaleDown,
                ),
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  height: 50.0,
                  width: 100.0,
                  fit: BoxFit.none,
                ),
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.difference,
                  fit: BoxFit.fill,
                ),
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100.0,
                  height: 200.0,
                  repeat: ImageRepeat.repeatY,
                )
              ].map((e) {
                return Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 100,
                        child: e,
                      ),
                    ),
                    Text(e.fit.toString())
                  ],
                );
              }).toList()),
        ),
      ),
    );
  }
}
