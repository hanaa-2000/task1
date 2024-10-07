import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:task1/book_app/models/books_model.dart';
import 'package:task1/book_app/services/books_api.dart';

import '../models/details_model.dart';

class BooksProviders extends ChangeNotifier{

  final bookApi = BooksApi();

  Future getBooksData()async{

    var res = await bookApi.getBookPopular();

    var data = jsonDecode(res);

    //print(data);

    return Books.fromJson(data);
  }

  Future getBooksAnime()async{

    var res = await bookApi.getBooksAnime();

    var data = jsonDecode(res);

    return Books.fromJson(data);

  }

  Future getBookAnime()async{
    var res = await bookApi.getBooksAnime();

    var data = jsonDecode(res);

    return Books.fromJson(data);

  }
  Future getBookAction()async{

    var res = await bookApi.getActionAndAdventure();

    var data = jsonDecode(res);

    return Books.fromJson(data);

  }

  Future  getBookNovel()async{
    var res = await bookApi.getBooksNovel();

    var data = jsonDecode(res);

    return Books.fromJson(data);

  }

  Future getHorror()async{

    var res = await bookApi.getBooksHorror();

    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

  Future<DetailModel>  showBooksDetails({required id})async{

    var res =await bookApi.showDetailsBooks(id: id);

    var data = jsonDecode(res);

    return DetailModel.fromJson(data);

  }
  
  Future<Books> searchBooksData({required  searchBook})async{
    
    var res = await bookApi.searchBooks(searchBook: searchBook);

    var data = jsonDecode(res);

    return Books.fromJson(data);
    
    
  }





}