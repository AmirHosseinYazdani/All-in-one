import 'package:flutter/material.dart';
import 'package:multi_app/apps/InstaApp/pages/favorite_page.dart';
import 'package:multi_app/apps/InstaApp/pages/home_page.dart';
import 'package:multi_app/apps/InstaApp/pages/plus_page.dart';
import 'package:multi_app/apps/InstaApp/pages/profile_page.dart';
import 'package:multi_app/apps/InstaApp/pages/search_page.dart';

class MyHomePages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePages> {
  int currentPageIndex = 0;

  final List childeren = [
    new HomePage(),
    new SearchPage(),
    new FavoritePage(),
    new PlusPage(),
    new ProfilePage(),
  ];

  final appBar = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    elevation: 2.0,
    centerTitle: true,
    leading: new Icon(Icons.camera_alt),
    title: new SizedBox(
      height: 80.0,
      child: Image(
        image: AssetImage('assets/images/insta_logo.png'),
      ),
    ),
    actions: <Widget>[
      new Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: new Icon(Icons.send))
    ],
  );

  changePage(int pageIndex) {
    setState(() {
      currentPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: appBar,
        body: this.childeren[currentPageIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'home'),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'search',
            ),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.add_box,
                  color: Colors.black,
                ),
                label: 'plus'),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
                label: 'favorite'),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.account_box,
                  color: Colors.black,
                ),
                label: 'profile'),
          ],
          onTap: changePage,
          currentIndex: currentPageIndex,
        ));
  }
}
