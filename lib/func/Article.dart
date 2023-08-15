import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<GetListArticleDto> GetListArticle(String Url) async {
  final response = await http.post(
    Uri.parse(Url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: null,
  );
  if (response.statusCode == 200) {
    final decodedResult = jsonDecode(response.body);
    return GetListArticleDto.fromJson(jsonDecode(response.body));
  } else {
    return GetListArticleDto();
  }
}

class GetListArticleDto {
  // ĐỐI TƯỢNG CHỨA LIST CÁC OBJECT DỮ LIỆU
  final List<ArticleListItemDto>? data;

  GetListArticleDto({this.data});

  factory GetListArticleDto.fromJson(Map<String, dynamic> jsons) {
    var streetsFromJson = jsons['result'];
    List<ArticleListItemDto> posts = [];
    for (var Variable in streetsFromJson) {
      posts.add(new ArticleListItemDto(
          id: Variable['id'],
          title: Variable['title'],
          image: Variable['image'],
          brief: Variable['brief'],
          posteddate: Variable['posted_date'],
          ));
    }

    return GetListArticleDto(data: posts);
  }
}

class ArticleDto extends ArticleListItemDto{
  // MỘT OBJECT DỮ LIỆU
  final String url;
  final String content;
  final int hot;
  final int home;
  final int active;
  final int luotxem;
  final String tags;
  final int cat_new_id;
  final String cat_new_name;
  ArticleDto({
    required this.url,
    required this.content,
    required this.hot,
    required this.home,
    required this.active,
    required this.luotxem,
    required this.tags,
    required this.cat_new_id,
    required this.cat_new_name,
    required super.id,
    required super.title,
    required super.image,
    required super.brief,
    required super.posteddate
  });
  factory ArticleDto.fromJson(Map<String, dynamic> jsons) {
    var streetsFromJson = jsons['result'];
    return new ArticleDto(
      id: streetsFromJson['id'],
      title: streetsFromJson['title'],
      image: streetsFromJson['image'],
      brief: streetsFromJson['brief'],
      posteddate: streetsFromJson['posted_date'],
      url: streetsFromJson['url'],
      content: streetsFromJson['content'],
      hot: streetsFromJson['hot'],
      home: streetsFromJson['home'],
      active: streetsFromJson['active'],
      luotxem: streetsFromJson['luotxem'],
      tags: streetsFromJson['tags'],
      cat_new_id: streetsFromJson['cat_new_id'],
      cat_new_name: streetsFromJson['cat_new_name'],
    );
  }
}

class ArticleListItemDto {
  final int id;
  final String title;
  final String image;
  final String brief;
  final String posteddate;

  ArticleListItemDto({
    required this.id,
    required this.title,
    required this.image,
    required this.brief,
    required this.posteddate
  });


}

Future<ArticleDto> GetArticleContent(int articleId) async{
  final response = await http.post(
    Uri.parse("https://techber.vn/appservices/getnewscontent.html"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, int>{
      "id":articleId
    }),
  );
  if (response.statusCode == 200) {
    final decodedResult = jsonDecode(response.body);
    return ArticleDto.fromJson(jsonDecode(response.body)); //mapping dữ liệu tu json => class cua minh
  } else {
     throw Exception("Article not found!");
  }
}