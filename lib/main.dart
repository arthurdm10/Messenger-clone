import 'dart:math';

import 'package:flutter/material.dart';
import 'package:messenger_clone/widgets/badge.dart';
import 'package:messenger_clone/widgets/chat_list_item.dart';
import 'package:messenger_clone/widgets/chat_trailling.dart';
import 'package:messenger_clone/widgets/main_screen_appbar.dart';
import 'package:messenger_clone/widgets/online_contact_item.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  final List<Widget> onlineContacts = [];
  final List<Widget> chats = [];

  MainPage() {
    for (var i = 1; i < 11; i++) {
      onlineContacts.add(
        onlineContactItem('Contato $i'),
      );
      chats.add(
        ChatListItem(
          chatName: "Contato $i",
          msg: Text(
            "Teste abc 1234",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          msgTime: randomMsgTime(),
          msgStatus: MsgStatus.values[Random().nextInt(3)],
          muted: Random().nextInt(2) == 1,
        ),
      );
    }
  }

  String randomMsgTime() {
    var hour = Random().nextInt(23) + 1;
    var min = Random().nextInt(59) + 1;

    var strHour = hour <= 9 ? '0$hour' : '$hour';
    var strMin = min <= 9 ? '0$min' : '$min';

    return '$strHour:$strMin';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: mainAppBar(),
        body: Container(
          margin: EdgeInsets.only(top: 2),
          child: ListView(
            children: <Widget>[
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    constraints: BoxConstraints(
                      maxHeight: 45,
                    ),
                    margin: EdgeInsets.only(top: 4),
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth - 340,
                      right: constraints.maxWidth - 340,
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
                padding: EdgeInsets.only(top: 12),
                margin: EdgeInsets.only(bottom: 8),
                height: 95,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    addStoryItem(),
                    ...onlineContacts,
                  ],
                ),
              ),
              ...chats,
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Tab(
                      child: Icon(IconData(0xe96b, fontFamily: 'icomoon')),
                    ),
                    Align(
                      widthFactor: 1.6,
                      heightFactor: 0,
                      alignment: Alignment.topRight,
                      child: Badge(
                        padding: EdgeInsets.all(3),
                        backgroundColor: Colors.white,
                        child: Badge(
                          backgroundColor: Colors.red,
                          child: Text(
                            "4",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Tab(
                  child: Stack(
                    children: <Widget>[
                      Tab(
                        child: Icon(
                          Icons.group,
                          color: Color(0xffa3a9b1),
                        ),
                      ),
                      Align(
                        widthFactor: 1.6,
                        heightFactor: 0,
                        alignment: Alignment.topRight,
                        child: Badge(
                          backgroundColor: Colors.white,
                          child: Text(
                            "7",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.near_me,
                    color: Color(0xffa3a9b1),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
