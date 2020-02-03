import 'package:flutter/material.dart';
import 'package:whats_app_ui/screens/calls_page.dart';
import 'package:whats_app_ui/screens/chats_page.dart';
import 'package:whats_app_ui/screens/status_page.dart';
import 'camera_page.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(
      vsync: this,
      initialIndex: 1,
      length: 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('WhatsApp'),
        elevation: 0.0,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.camera_alt),
            ),
            new Tab(
              text: 'CHATS',
            ),
            new Tab(
              text: 'STATUS',
            ),
            new Tab(
              text: 'CALLS',
            ),
          ],
        ),
        actions: <Widget>[
          new Icon(
            Icons.search,
          ),
          SizedBox(width: 5.0,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: new Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraPage(),
          new ChatsPage(),
          new StatusPage(),
          new CallsPage()
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () => print('open chat')),
    );
  }
}
