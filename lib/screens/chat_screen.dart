import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/json_model.dart';
// import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:whatsapp/screens/chat.dart';

// class Chat extends StatefulWidget {
//   const Chat({Key? key}) : super(key: key);

//   @override
//   _ChatState createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {


// @override
//   Widget build(BuildContext context) {
//     return Container(
      
//       // child: ListView.builder(itemBuilder: (BuildContext context, int index) {  },
//     );
//   }
// }
class Services {

   static const String url = 'https://api.github.com/users';

   static Future<List<Users>> getUsers() async {
     var url = Uri.https('api.github.com','/users');
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        // var jsonResponse =
        // convert.jsonDecode(response.body) as Map<String, dynamic>;
        final List<Users> users = usersFromJson(response.body);
        return users;
        // print(data);  
      } else {
        return <Users>[];
      }
    } catch (e) {
      return <Users>[];
    }
  }
}
class MyHomeClass extends StatefulWidget {
  const MyHomeClass({ Key? key }) : super(key: key);

  @override
  _MyHomeClassState createState() => _MyHomeClassState();
}

class _MyHomeClassState extends State<MyHomeClass> {


 bool _isLoading= true;
 List<Users> ?_users;
 @override
  void initState() {
    super.initState();
     _isLoading = true;
     Services.getUsers().then((users) {
       setState((){
         _users = users;
       _isLoading = false;
      });
     }); 
    
  }
 @override
  Widget build(BuildContext context) {
    return   Container(
      //  appBar: AppBar(
        //  title: Text(_isLoading ? 'Load Data' : 'Users'),
      //  ),
        // Container(
         color: Color(0xff075e54),
         child: ListView.builder(
           itemCount: null == _users ? 0 : _users!.length,
           itemBuilder: (context, index){
           Users users = _users![index];
          //  print("======> ${users}");
           return  InkWell(
             onTap: (){
Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
            Chat(),
        ),
      );             },
             child: Card(
               child: ListTile(
                 leading: CircleAvatar(
                   backgroundImage: NetworkImage(users.avatarUrl, scale: 10),
                 ),
                 title: Text(users.login.toString()),
               ),
             ),
           );
         }),
       );
      // );
  }
} 