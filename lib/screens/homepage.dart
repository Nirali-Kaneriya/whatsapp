import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
 
  final List<Tab> topTabs = <Tab>[
    Tab(text: 'CHATS'),
    Tab(text: 'STATUS'),
    Tab(text: 'CALLS'),
  ];

 @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: 0,vsync: this);
   
    
    super.initState();
    
  }
  @override
 Widget build(BuildContext context) {
   return Scaffold(
    
     appBar: AppBar(
       title: Text('WhatsApp'),
       actions: [
        IconButton(onPressed: (){print(',,,');}, icon: Icon(Icons.search)),
        IconButton(onPressed: (){print('...');}, icon: Icon(Icons.more_vert))

       ],
       bottom: TabBar(
         controller: _tabController,
         indicatorColor: Colors.white,
         tabs: topTabs,),
       backgroundColor: Color(0xff075e54)),
       body: TabBarView(controller: _tabController,children: [
         MyHomeClass(),
                  MyHomeClass(),
                           MyHomeClass(),


         ],),
    );
    
 }

  void addListener(Null Function() param0) {} 
}
