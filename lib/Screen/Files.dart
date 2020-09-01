import 'package:flutter/material.dart';
import 'package:googledriveclone_flutter/Data/Files.dart';
import 'package:googledriveclone_flutter/Screen/Home.dart';
import 'package:googledriveclone_flutter/Widget/recent.dart';
import 'package:googledriveclone_flutter/Widget/smallGrid.dart';

void main() {
  runApp(MyDriveScreen());
}

class MyDriveScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyDriveScreenPage();
  }
}

class MyDriveScreenPage extends StatefulWidget {
  MyDriveScreenPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyDriveScreenPageState createState() => _MyDriveScreenPageState();
}

class _MyDriveScreenPageState extends State<MyDriveScreenPage> with SingleTickerProviderStateMixin{


  final TrackingScrollController scrollController = TrackingScrollController();
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      child: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget> [
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: controller,
                  labelColor: Color(0xFF1777F2),
                  indicatorColor: Colors.blue.shade700,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "My Drive",),
                    Tab(text: "Computers",),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
          body: TabBarView(
            controller: controller,
            children: [
              Container(
                child: GridView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: files.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  2 ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                        child: new SmallGridWIdget(file: files[index],)
                    );
                  },
                ),
              ),
              Container(
                child: Center(
                  child: Text('Design Required'),
                ),
              )
            ],
          )
      ),
    );
  }
}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}