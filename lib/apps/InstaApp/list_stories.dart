import 'package:flutter/material.dart';

class ListStories extends StatelessWidget {
  final topText = new Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      new Text('stories', style: new TextStyle(fontWeight: FontWeight.bold)),
      new Row(
        children: <Widget>[
          new Icon(Icons.play_arrow),
          new Text('watch all', style: TextStyle(fontWeight: FontWeight.bold))
        ],
      )
    ],
  );

  final stories = new Expanded(
      child: new Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return new Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              new Container(
                width: 40.0,
                height: 40.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage('assets/images/insta_profile_image.jpg'),
                    )),
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
              ),
              index == 0
                  ? new CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 10.0,
                      child: new Icon(
                        Icons.add,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    )
                  : new Container()
            ],
          );
        }),
  ));

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[topText, stories],
      ),
    );
  }
}
