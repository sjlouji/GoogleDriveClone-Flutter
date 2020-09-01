import 'package:flutter/material.dart';
import 'package:googledriveclone_flutter/Screen/Files.dart';
import 'package:googledriveclone_flutter/Screen/HomeScreen.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Drive Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Google Drive Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _widgetBody = HomeScreen();
  int _currrentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) async{
    setState(() {
      if(index == 0){
        _currrentIndex = index;
        _widgetBody = HomeScreen();
      }
      else if(index == 1){
        _currrentIndex = index;
        _widgetBody = Center(child: Text('Hell'),);
      }
      else if(index == 2){
        _currrentIndex = index;
        _widgetBody = Center(child: Text('Hell'),);
      }
      else if(index == 3){
        _currrentIndex = index;
        _widgetBody = MyDriveScreen();
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: SliverAppBar(
                  toolbarHeight: 80,
                  pinned: false,
                  backgroundColor: Colors.white,
                  title: Container(
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Search in Drive",
                              border: InputBorder.none,
                              icon: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Icon(Icons.dehaze)
                              ),
                              suffixIcon: Container(
                                height: 5,
                                width: 5,
                                margin: EdgeInsets.all(5),
                                child: CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 14.0,
                                    backgroundColor: Colors.grey[200],
                                    backgroundImage: NetworkImage("https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp"),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ];
          },
          body: _widgetBody,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currrentIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Colors.blue.shade700,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
            icon: _currrentIndex==0?Icon(Icons.home,size: 25,):Icon(Icons.home_outlined,size: 25),
            title: Text("Home")
        ),
        BottomNavigationBarItem(
            icon: _currrentIndex==1?Icon(Icons.star,size: 25,):Icon(Icons.star_border_outlined,size: 25),
            title: Text("Starred")
        ),
        BottomNavigationBarItem(
            icon: _currrentIndex==2?Icon(Icons.supervised_user_circle,size: 25,):Icon(Icons.supervised_user_circle,size: 25),
            title: Text("Shared")
        ),
        BottomNavigationBarItem(
            icon: _currrentIndex==3?Icon(Icons.folder,size: 25,):Icon(Icons.folder_open,size: 25),
            title: Text("Files")
        ),
      ],
    ),    );
  }
}
