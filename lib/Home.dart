import 'package:flutter/material.dart';
import './PostNewEventForm.dart' as add;
import './UpcomingPage.dart' as upcoming;
import './StarredPage.dart' as star;
import './Drawer.dart' as drawer;
import './loginStuff.dart' as login;


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => new _HomePageState();


}


class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  _handleChangeIndex(int newIndex) {
    setState(() {
      this.currentIndex = newIndex;
    });
  }

  List<BottomNavigationBarItem> navItems = [
    new BottomNavigationBarItem(
        icon: new Icon(Icons.event), title: new Text("Upcoming")),
    new BottomNavigationBarItem(
        icon: new Icon(Icons.star), title: new Text("Starred"))
  ];

  List pages = [
    new upcoming.UpcomingPage(),
    new star.StarredEventsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    login.checkLogin();
    return new Scaffold(
//        backgroundColor: new Color.fromRGBO(210, 213, 219, 1.0),
      appBar: new AppBar(
        title: new Text("Free Food App"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) {
                      return new add.NewEventForm();
                    }
                )
                );
              }
          )
        ],
      ),

      drawer: new drawer.MainDrawer("Home"),

      body: pages[this.currentIndex],

      bottomNavigationBar: new BottomNavigationBar(
        onTap: (index) {
          _handleChangeIndex(index);
        },
        currentIndex: this.currentIndex,
        items: navItems,
      ),
    );
  }
}

