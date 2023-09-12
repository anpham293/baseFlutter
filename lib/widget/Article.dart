import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learn_flutter/model/Article.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:learn_flutter/function/function.dart';
import 'package:learn_flutter/news_app/view_article.dart';

class ArticleWidget extends StatelessWidget{
  ArticleListItemDto Article;
  ArticleWidget({
    super.key,
    required this.Article
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewArticle(
                  articleId: Article.id,
                )));
      },
      child:Padding(
        padding: const EdgeInsets.only(
            top: 16.0, bottom: 16.0, left: 12.0, right: 12.0),
        child: Card(
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      Article.image,
                      fit: BoxFit.fitWidth,
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                        title: Text(Article.title,style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Html(data: Article.brief)
                    )
                )
              ],
            )
        )
      ),
    );
  }
}