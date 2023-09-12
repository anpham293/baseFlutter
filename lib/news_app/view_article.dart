import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learn_flutter/common_widget/Scaffoldlayout.dart';
import 'package:learn_flutter/model/Article.dart';
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
    final List<Widget> view_article_body = <Widget>[
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
    ];
    return ScaffoldLayout(body: view_article_body, title: (data!=null)?data!.title:"",bottomNavigationBarType: "BasicBottomNavigationBar",);
  }

}