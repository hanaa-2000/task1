import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/book_app/const/text_style.dart';
import 'package:task1/book_app/screens/widgets/build_button.dart';
import 'package:task1/book_app/screens/widgets/card_image.dart';
import 'package:task1/book_app/services/books_providers.dart';

class DetailsBooks extends StatefulWidget {
  const DetailsBooks({super.key, required this.id, required this.boxColor});

  final id;
  final Color boxColor;

  @override
  State<DetailsBooks> createState() => _DetailsBooksState();
}

class _DetailsBooksState extends State<DetailsBooks> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Consumer<BooksProviders>(
            builder: (context, value, child) {
              return FutureBuilder(
                future: value.showBooksDetails(id: widget.id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Opps! Try again later!"),
                    );
                  } else if (snapshot.hasData) {
                    return Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: widget.boxColor ?? const Color(0xffF9CFE3),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 30, right: 20, left: 20),
                          height: MediaQuery.of(context).size.height * 1.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: 80,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                  child: cardImageWidget(context,
                                      img: snapshot.data?.volumeInfo?.imageLinks
                                          ?.thumbnail)),
                              const SizedBox(
                                height: 30,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        snapshot.data?.volumeInfo?.title ??
                                            "Censored",
                                        style: TextStyleMethods.mainFontStyle(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${snapshot.data?.volumeInfo!.authors?.length != 0 ? snapshot.data?.volumeInfo!.authors![0] : "Censored"}",
                                      style: TextStyleMethods.lightFontStyle(),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "${snapshot.data?.volumeInfo?.printType}",
                                          style:
                                              TextStyleMethods.lightFontStyle(),
                                        ),
                                        buildDetailsButton(
                                            "${snapshot.data?.volumeInfo?.pageCount}"),
                                        Text(
                                          "${snapshot.data?.volumeInfo?.pageCount} Pages",
                                          style:
                                              TextStyleMethods.lightFontStyle(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildDetailsSpecialButton(
                                          onTap: () async {
                                            Uri url = Uri.parse(
                                                "${snapshot.data?.volumeInfo?.previewLink}");

                                            // if (await canLaunchUrl(url)) {
                                            // await launchUrl(url,
                                            // mode: LaunchMode
                                            //     .externalApplication);
                                            // } else {
                                            // throw 'could not launch $url';
                                            // }
                                          },
                                          widget: Text(
                                            "VIEW ONLINE",
                                            style: TextStyleMethods
                                                .lightFontStyle(),
                                          ),
                                        ),
                                        buildDetailsSpecialButton(
                                            widget: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      fav = !fav;
                                                    });
                                                  },
                                                  child: fav
                                                      ? const Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .favorite_outline_rounded,
                                                        ),
                                                ),
                                                Text(
                                                  "WISHLIST",
                                                  style: TextStyleMethods
                                                      .lightFontStyle(),
                                                ),
                                              ],
                                            ),
                                            onTap: () {}),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    buildDetailsText(
                                        title1:
                                            "${snapshot.data?.volumeInfo?.authors![0] ?? []}",
                                        title2:
                                            "${snapshot.data?.volumeInfo?.publisher}",
                                        title3:
                                            "${snapshot.data?.volumeInfo?.publishedDate}",
                                        title4:
                                            "${snapshot.data?.volumeInfo!.categories![0]}"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Description",
                                          style:
                                              TextStyleMethods.baseFontStyle(),
                                        )),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "${snapshot.data?.volumeInfo?.description}",
                                      style: TextStyleMethods
                                          .lightDetailsFontStyle(),
                                      maxLines: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
        ),
      ),
    );
  }

  Widget buildDetailsText(
      {required String title1,
      required String title2,
      required String title3,
      required String title4}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Details",
          style: TextStyleMethods.baseFontStyle(),
        ),
        const SizedBox(
          height: 15,
        ),
        buildDetailsTextItem(
            title1: title1, title2: title2, title3: title3, title4: title4),
      ],
    );
  }

  Widget buildDetailsTextItem(
      {required String title1,
      required String title2,
      required String title3,
      required String title4}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Author",
              style: TextStyleMethods.lightFontStyle(),
            ),
            Text(
              "Publisher",
              style: TextStyleMethods.lightFontStyle(),
            ),
            Text(
              "Published Data",
              style: TextStyleMethods.lightFontStyle(),
            ),
            Text(
              "Categories",
              style: TextStyleMethods.lightFontStyle(),
            ),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 190,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: TextStyleMethods.lightDetailsFontStyle(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                title2,
                style: TextStyleMethods.lightDetailsFontStyle(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                title3,
                style: TextStyleMethods.lightDetailsFontStyle(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                title4,
                style: TextStyleMethods.lightDetailsFontStyle(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
