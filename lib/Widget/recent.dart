import 'package:flutter/material.dart';
import 'package:googledriveclone_flutter/Models/Recent.dart';
import 'package:googledriveclone_flutter/Screen/Home.dart';

void main() {
  runApp(RecentWidget());
}

class RecentWidget extends StatelessWidget {
  RecentWidget({Key key, this.recent}) : super(key: key);

  Recent recent;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RecentWidgetPage(recent: recent,);
  }
}

class RecentWidgetPage extends StatefulWidget {
  RecentWidgetPage({Key key, this.title, this.recent}) : super(key: key);

  final String title;
  Recent recent;
  @override
  _RecentWidgetPageState createState() => _RecentWidgetPageState();
}

class _RecentWidgetPageState extends State<RecentWidgetPage> {

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: 290,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                            height: 25,
                            width: 20,
                            child: fileImage(widget.recent.fileType),
                        ),
                        SizedBox(width: 30,),
                        Container(
                            child: Text(widget.recent.fileName, style: TextStyle(fontSize: 18),)
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Icon(Icons.more_vert),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]
                ),
                child: Container(
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InteractiveViewer(
                            panEnabled: false, // Set it to false
                            boundaryMargin: EdgeInsets.all(80),
                            minScale: 0.5,
                            maxScale: 3,
                            child: Image.network(widget.recent.fileImage, fit: BoxFit.cover, width: 340,height: 130,)
                        )
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text('You shared this a week ago', style: TextStyle(fontSize: 12),),
              ),
              Divider(color: Colors.grey,height: 2,)
            ],
          ),
        )
    );
  }
}


fileImage(String filename){
  if(filename == 'docs'){
    return Image.asset("assets/google-docs.png");
  }else if(filename == 'image'){
    return Image.asset("assets/photo.png");
  }else if(filename == 'pdf'){
    return Image.asset("assets/pdf.png");
  }else if(filename == 'sheets'){
    return Image.asset("assets/google-sheets.png");
  }else if(filename == 'video'){
    return Image.asset("assets/photographic-flim.png");
  }else{
    return Image.asset("assets/pdf.png", color: Colors.blue,);
  }
}