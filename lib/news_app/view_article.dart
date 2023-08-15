import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learn_flutter/func/Article.dart';
import 'package:learn_flutter/widget/Article.dart';

class ViewArticle extends StatefulWidget{
  final int articleId;
  ViewArticle({
    super.key,
    required this.articleId
  });

  @override
  State<ViewArticle> createState()=> _ViewArticle();
}

class _ViewArticle extends State<ViewArticle> {

  ArticleDto? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EasyLoading.show(status: 'loading...');
    Future<ArticleDto> futureData = GetArticleContent(widget.articleId);
    futureData.then((value){
        setState(() {
          data=value!;
        });
        EasyLoading.dismiss();
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text((data!=null)?data!.title:""),
      ),//header
      body: Center( //body
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
          children: <Widget>[
            Expanded(
              child: (data!=null)?
              SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 16.0, left: 12.0, right: 12.0),
                    child: Card(
                        child: Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  data!.image,
                                  fit: BoxFit.fitWidth,
                                )
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: ListTile(
                                    title: Text(data!.title,style: TextStyle(fontWeight: FontWeight.bold)),
                                    subtitle: Html(data: data!.brief)
                                )
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(data!.posteddate+", "+data!.luotxem.toString()+" lượt xem",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic))
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Html(data: data!.content)
                            )
                          ],
                        )
                    )
                ),
              )
              :Text("")
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:  () async {
          setState(() {

          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}