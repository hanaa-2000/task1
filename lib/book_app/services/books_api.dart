
import 'dart:convert';

import 'package:http/http.dart' as http;

class BooksApi{

  Future  getBookPopular()async{
    var respond = await http.get(Uri.parse("https://www.googleapis.com/books/v1/volumes?q=Fiction&maxResults=40"));

    var body = respond.body;

    //print(body);
    return body;

  }

  Future getBooksAnime()async{
    var respond = await http.get(Uri.parse("https://www.googleapis.com/books/v1/volumes?q=amine+manga&maxResults=39"));

    var body = respond.body;

    return body;

  }
  
  Future getActionAndAdventure()async{
    var respond = await http.get(Uri.parse("https://www.googleapis.com/books/v1/volumes?q=action+adventure&maxResults=39"));
    
    var body = respond.body;
    
    return body;
    
  }
  
  Future getBooksNovel()async{
    var respond = await http.get(Uri.parse("https://www.googleapis.com/books/v1/volumes?q=novel&maxResults=39"));
    
    var body = respond.body;
    
    return body;
    
  }
  
  Future getBooksHorror()async{
    
    var respond = await http.get(Uri.parse("https://www.googleapis.com/books/v1/volumes?q=horroe&maxResults=39"));
    var body = respond.body;

    return body;
    
  }

  Future showDetailsBooks({required String id})async{

    var respond = await http.get(Uri.parse("https://www.googleapis.com/books/v1/volumes/$id"));

    var body = respond.body;

    return body;

  }

  Future searchBooks({required String searchBook})async{
    var respond = await http.get(Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$searchBook&maxResults=39"));

    var body = respond.body;

    return body;

}


}