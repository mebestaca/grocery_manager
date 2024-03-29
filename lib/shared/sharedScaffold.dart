import 'package:flutter/material.dart';
import 'package:grocery_manager/shared/sharedBackground.dart';

class SharedScaffold extends StatefulWidget {
  const SharedScaffold({Key? key}) : super(key: key);

  @override
  _SharedScaffoldState createState() => _SharedScaffoldState();
}

class _SharedScaffoldState extends State<SharedScaffold> {

  Widget _widgetBody = Container();
  String _title = "";

  Map _data = {};

  @override
  void initState() {
    Future.delayed(Duration.zero, (){
      _data = ModalRoute.of(context)?.settings.arguments as Map;
      setState(() {
        _widgetBody = _data["widget"];
        _title = _data["title"];
      });
    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Stack(
        children: [
          const Background(),
          _widgetBody,
        ],
      ),
    );
  }
}


