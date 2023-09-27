import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_app/apps/InstaApp/list_stories.dart';

class HomePage extends StatelessWidget {
  final instaPost = new Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(right: 15.0),
                  width: 40.0,
                  height: 40.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new AssetImage(
                              'assets/images/insta_profile_image.jpg'))),
                ),
                new Text(
                  'Amir.H Yazdani',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            new IconButton(icon: new Icon(Icons.more_vert), onPressed: null)
          ],
        ),
      ),
      new Row(
        children: <Widget>[
          new Expanded(
              child: Image.network(
                  'https://mcdn.wallpapersafari.com/medium/79/79/2AqXbN.jpg'))
        ],
      ),
      new Padding(
        padding: EdgeInsets.all(16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new IconButton(icon: new Icon(Icons.favorite), onPressed: null),
                new IconButton(
                    icon: new Icon(Icons.mode_comment), onPressed: null),
                new IconButton(
                    icon: new Icon(FontAwesomeIcons.paperPlane),
                    onPressed: null),
              ],
            ),
            new IconButton(
                icon: new Icon(Icons.bookmark_border), onPressed: null),
          ],
        ),
      ),
      new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new Text(
          "sombody likes the Post!",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      new Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
        child: new Row(
          children: <Widget>[
            new Container(
              width: 40.0,
              height: 40.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/insta_profile_image.jpg'),
                  )),
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
            new Expanded(
                child: new TextField(
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: 'اضافه کردن یک نظر...',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400, fontFamily: 'Vazir')),
            ))
          ],
        ),
      ),
      new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new Text(
          '1 روز قبل ',
          style: TextStyle(color: Colors.grey),
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    print(deviceSize);
    return new ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return index == 0
            ? new SizedBox(
                child: new ListStories(),
                height: deviceSize.height * 0.15,
              )
            : instaPost;
      },
    );
  }
}
