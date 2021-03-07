import 'package:flutter/material.dart';

class ConnectionsPage extends StatefulWidget {
  @override
  _ConnectionsPageState createState() => _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage>
    with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(child:Text('Connections Student'));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}