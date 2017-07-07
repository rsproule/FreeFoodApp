import 'package:flutter/material.dart';
import './Home.dart' as home;
import './Drawer.dart' as _Drawer;
import './loginStuff.dart' as log;


class MainDrawer extends StatefulWidget {
  String currpage = "";

  MainDrawer(String cp) {
    this.currpage = cp;
  }

  @override
  MainDrawerState createState() => new MainDrawerState(currpage);
}

class MainDrawerState extends State<MainDrawer> {
  String currentPage = "";

  MainDrawerState(String cp) {
    this.currentPage = cp;
  }

  bool useLightTheme = true;
  ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final Widget lightThemeItem = new RadioListTile<bool>(
      secondary: const Icon(Icons.brightness_5),
      title: const Text('Light'),
      value: true,
      groupValue: useLightTheme,
      onChanged: onThemeChanged,
      selected: useLightTheme,
    );

    final Widget darkThemeItem = new RadioListTile<bool>(
      secondary: const Icon(Icons.brightness_7),
      title: const Text('Dark'),
      value: false,
      groupValue: useLightTheme,
      onChanged: onThemeChanged,
      selected: !useLightTheme,
    );


    return new Drawer(

        child: new Column(

            children: <Widget>[

              new Padding(padding: new EdgeInsets.all(10.0)),
              new DrawerHeader(
                padding: new EdgeInsets.all(50.0),
                child: new Text(
                    "WU Free Grub",
                    textScaleFactor: 2.0,
                    style: new TextStyle(color: Colors.blue)),
              ),
              lightThemeItem,
              darkThemeItem,
              new Divider(),
              new ListTile(
                  leading: new Icon(Icons.home),
                  title: new Text("Home"),
                  selected: currentPage == "Home",
                  onTap: () {
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (BuildContext context) {
                          return new home.HomePage();
                        }
                    )
                    );
                  }


              ),
              new ListTile(
                  leading: new Icon(Icons.person),
                  title: new Text("Profile"),
                  selected: currentPage == "Profile",
                  onTap: () {
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (BuildContext context) {
                          return new Scaffold(
                              appBar: new AppBar(title: new Text("Profile")),
                              drawer: new _Drawer.MainDrawer("Profile"),
                              body: new Center(
                                  child: new Text("Nother here yet"))
                          );
                        }
                    )
                    );
                  }


              ),
              new ListTile(
                  leading: new Icon(Icons.settings),
                  title: new Text("Settings"),
                  selected: currentPage == "Settings",
                  onTap: () {
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (BuildContext context) {
                          return new Scaffold(
                              drawer: new _Drawer.MainDrawer("Settings"),
                              appBar: new AppBar(title: new Text("Settings")),
                              body: new Center(
                                  child: new Text("Nother here yet"))
                          );
                        }
                    )
                    );
                  }


              ),

              new AboutListTile(icon: new Icon(Icons.info),
                  applicationName: "Name of App",
                  applicationVersion: "1.0.0",
                  applicationLegalese: "Created by Ryan Sproule"
              ),


            ]
        )
    );
  }
}