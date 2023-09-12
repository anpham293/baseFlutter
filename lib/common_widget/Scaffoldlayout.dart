import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/common_widget/BottomNavigationBar/BottomNavigationBar.dart';

class ScaffoldLayout extends StatefulWidget {
  final String title;
  final List<Widget> body; //content
  final Widget? floatingActionButton;
  final String bottomNavigationBarType;

  ScaffoldLayout(
      {
        super.key,
        required this.body,
        required this.title,
        this.floatingActionButton,
        required this.bottomNavigationBarType
      });

  @override
  State<StatefulWidget> createState() => _ScaffoldLayout();
}

Widget? getBottomBarByType(String type){
  switch(type){
    case "":
      return null;
    case "BasicBottomNavigationBar":
      return BasicBottomNavigationBar();
  }
}

class _ScaffoldLayout extends State<ScaffoldLayout> {
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.shade100,
        toolbarHeight: 100,
        elevation: 14,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70))),
        iconTheme: IconThemeData(
          color: Colors.grey.shade50, //change your color here
        ),
        title: Text(
          widget.title,
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 14, spreadRadius: 0, color: Colors.deepOrangeAccent)
                ], shape: BoxShape.circle, color: Colors.deepOrangeAccent.shade200),
                child: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 14, spreadRadius: 0, color: Colors.deepOrangeAccent)
                ], shape: BoxShape.circle, color: Colors.deepOrangeAccent.shade200),
                child: Icon(
                  Icons.logout,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 26,
              )
            ],
          )
        ],
      ),

      body: Center(
        //body
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.body,
        ),
      ),

      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: getBottomBarByType(widget.bottomNavigationBarType), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
