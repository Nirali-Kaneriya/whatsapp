import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        titleSpacing: 0,
        backgroundColor: Color(0xff075e54),
        title: Row(
        //   children: [
        //     CircleAvatar(backgroundImage: AssetImage(Icons.a),),
        //   ],
        ),
      ),
      body: Column(children: [ Text('Messages'),
      
      ],),
    );
  }
}