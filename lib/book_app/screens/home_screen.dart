import 'package:flutter/material.dart';
import 'package:task1/book_app/const/text_style.dart';
import 'package:task1/book_app/screens/books_list.dart';
import 'package:task1/book_app/screens/details_books.dart';
import 'package:task1/book_app/screens/widgets/books_ltem.dart';
import 'package:task1/book_app/screens/widgets/build_card_special.dart';
import 'package:task1/book_app/screens/widgets/build_subject.dart';
import 'package:task1/book_app/screens/widgets/popular_book.dart';
import 'package:task1/book_app/screens/widgets/search_widgets.dart';
import 'package:task1/book_app/services/books_providers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String name ="";


  @override
  Widget build(BuildContext context) {
    String errorLink =
        "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Color(0xffd2f6ff),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.height / 2.5),
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height / 2,
                //   decoration: const BoxDecoration(
                //       color: Colors.white,
                //       ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 2.5,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Book Store",
                          style: TextStyleMethods.mainFontStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildTextFormWidgets(context,searchBook: name,onChanged: (value){
                          setState(() {
                            name = value;

                          });
                        }),
                        const SizedBox(
                          height: 30,
                        ),
                        buildSubjectWidget("Most Popular",() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BooksList(name: "Fiction"),
                          ));
                        },),
                        const SizedBox(
                          height: 30,
                        ),
                        FutureBuilder(
                          future: BooksProviders().getBooksData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("Opps! Try again later!"),
                              );
                            } else if (snapshot.hasData) {
                              return SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.items!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var data =
                                        snapshot.data?.items![index].volumeInfo;
                                    return InkWell(
                                        child: popularBookWidget(
                                      context,
                                      img: data.imageLinks?.thumbnail,
                                      title:
                                          "${data.authors?.length != 0 ? data.authors![0] : "Censored"}",
                                      author: "${data.title}",
                                      category:
                                          "${data.categories?.length != 0 ? data.categories![0] : "Unknown"}",
                                    ));
                                  },
                                  scrollDirection: Axis.horizontal,
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildSubjectWidget(
                          "Anime",
                          () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const BooksList(name: "Anime"),
                            ));
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FutureBuilder(
                          future: BooksProviders().getBooksAnime(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("Opps! Try again later!"),
                              );
                            } else if (snapshot.hasData) {
                              return SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.items!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var data =
                                        snapshot.data!.items![index].volumeInfo;
                                    return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsBooks(
                                                        boxColor: boxColors[4],
                                                        id: snapshot.data
                                                            ?.items![index].id,
                                                      )));
                                        },
                                        child: buildCardSpecial(context,
                                            img: data.imageLinks?.thumbnail ??
                                                errorLink,
                                            title: snapshot.data?.items![index]
                                                .volumeInfo?.title,
                                            price: snapshot.data?.items![index]
                                                .volumeInfo?.pageCount));
                                  },
                                  scrollDirection: Axis.horizontal,
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
                        ),
                        ///////////////
                        const SizedBox(
                          height: 10,
                        ),
                        buildSubjectWidget("Action & adventure",() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BooksList(name: "Action & Adventure"),
                          ));
                        },),
                        const SizedBox(
                          height: 5,
                        ),
                        FutureBuilder(
                          future: BooksProviders().getBookAction(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("Opps! Try again later!"),
                              );
                            } else if (snapshot.hasData) {
                              return SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.items!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsBooks(
                                                      boxColor: boxColors[2],
                                                      id: snapshot.data
                                                          ?.items![index].id,
                                                    )));
                                      },
                                      child: buildCardSpecial(context,
                                          img: snapshot
                                                  .data
                                                  ?.items?[index]
                                                  .volumeInfo
                                                  ?.imageLinks
                                                  ?.smallThumbnail ??
                                              errorLink,
                                          title: snapshot.data?.items![index]
                                              .volumeInfo?.title,
                                          price: snapshot.data?.items![index]
                                              .volumeInfo?.pageCount),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        buildSubjectWidget("Novel",() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BooksList(name: "Novel"),
                          ));
                        },),
                        const SizedBox(
                          height: 5,
                        ),
                        FutureBuilder(
                          future: BooksProviders().getBookNovel(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("Opps! Try again later!"),
                              );
                            } else if (snapshot.hasData) {
                              return SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.items!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsBooks(
                                                      boxColor:boxColors[3],
                                                      id: snapshot.data
                                                          ?.items![index].id,
                                                    )));
                                      },
                                      child: buildCardSpecial(context,
                                          img: snapshot
                                                  .data
                                                  ?.items?[index]
                                                  .volumeInfo
                                                  ?.imageLinks
                                                  ?.thumbnail ??
                                              errorLink,
                                          title: snapshot.data?.items![index]
                                                  .volumeInfo?.title ??
                                              "Censored",
                                          price: snapshot.data?.items?[index]
                                                  .volumeInfo?.pageCount ??
                                              "298"),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
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
                        ),
                        //////////////////
                        const SizedBox(
                          height: 10,
                        ),
                        buildSubjectWidget("Horror",() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BooksList(name: "Horror"),
                          ));
                        }),
                        const SizedBox(
                          height: 5,
                        ),
                        FutureBuilder(
                          future: BooksProviders().getHorror(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("Opps! Try again later!"),
                              );
                            } else if (snapshot.hasData) {
                              return SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.items!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsBooks(boxColor: boxColors[0],
                                                      id: snapshot.data
                                                          ?.items![index].id,
                                                    )));
                                      },
                                      child: buildCardSpecial(context,
                                          img: snapshot
                                                  .data
                                                  ?.items?[index]
                                                  .volumeInfo
                                                  ?.imageLinks
                                                  ?.thumbnail ??
                                              errorLink,
                                          title: snapshot.data?.items![index]
                                              .volumeInfo?.title,
                                          price: snapshot.data?.items![index]
                                              .volumeInfo?.pageCount),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
