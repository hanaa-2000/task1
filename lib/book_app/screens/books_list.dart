import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/book_app/const/text_style.dart';
import 'package:task1/book_app/screens/details_books.dart';
import 'dart:math' as math;

import 'package:task1/book_app/screens/widgets/books_ltem.dart';
import 'package:task1/book_app/services/books_providers.dart';

class BooksList extends StatefulWidget {
  const BooksList({super.key, required this.name});

  final String name;

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  final _randomIndex = math.Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.name,
          style: TextStyleMethods.baseFontStyle(),
        ),
      ),
      body: Consumer<BooksProviders>(
        builder: (context, value, child) {
          return FutureBuilder(
            future: value.searchBooksData(searchBook: widget.name),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Opps! Try again later!"),
                );
              } else if (snapshot.hasData) {
                return Container(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 350,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1),
                    itemCount: snapshot.data?.items!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsBooks(boxColor:boxColors[_randomIndex.nextInt(7)],id: snapshot.data?.items?[index].id),));
                        },
                        child: buildBooksItem(
                          context,
                          index: _randomIndex.nextInt(7),
                          img: snapshot.data?.items![index].volumeInfo!
                              .imageLinks!.thumbnail,
                          title: snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Not Found",
                          desc: snapshot.data?.items![index].volumeInfo?.title,
                          price:snapshot.data?.items![index].volumeInfo?.pageCount,
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
