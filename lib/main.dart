import 'package:flutter/material.dart';
import 'package:messenger_clone/widgets/main_screen_appbar.dart';
import 'package:messenger_clone/widgets/online_contact_item.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  final List<Widget> onlineContacts = [];

  MainPage() {
    for (var i = 1; i < 11; i++) {
      onlineContacts.add(
        onlineContactItem('Contato $i'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: mainAppBar(),
        body: Container(
          margin: EdgeInsets.only(top: 8),
          child: ListView(
            children: <Widget>[
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    constraints: BoxConstraints(
                      maxHeight: 38,
                    ),
                    margin: EdgeInsets.only(top: 2),
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth - 360,
                      right: constraints.maxWidth - 360,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        hintText: "Search",
                        filled: true,
                        fillColor: Color(0xffefefef),
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 75,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    addStoryItem(),
                    ...onlineContacts,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
