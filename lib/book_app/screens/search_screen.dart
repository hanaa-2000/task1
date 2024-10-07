import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/book_app/const/text_style.dart';
import 'package:task1/book_app/screens/details_books.dart';
import 'package:task1/book_app/services/books_providers.dart';


class SearchScreen  extends StatefulWidget {
  const SearchScreen({super.key, required this.searchBook});
final String searchBook;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search" , style: TextStyleMethods.baseFontStyle(),),
      ),
      body:Consumer<BooksProviders>(
        builder: (context, value, child) {
          return FutureBuilder(
              future: BooksProviders().searchBooksData(searchBook: widget.searchBook),
              builder:(context , snapshot){
                if(snapshot.hasError){
                  return const Center(
                    child: Text("Opps! Try again later!"),
                  );
                }
                else if(snapshot.hasData){
                  return  Container(
                    child: ListView.builder(
                      itemCount: snapshot.data?.items?.length,

                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsBooks(id:snapshot.data!.items![index].id , boxColor: boxColors[3]),));
                            },
                            child: buildSearchWidgets(img:snapshot.data?.items?[index].volumeInfo?.imageLinks?.thumbnail ?? errorLink ,title:snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Not Found",author:snapshot.data?.items![index].volumeInfo?.title ));
                      },),
                  );
                }
                else{
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
              }
          );
        },
      ),


    );
  }
  Widget buildSearchWidgets({img, title , author}){

    return Padding(
      padding: const EdgeInsets.only(bottom: 8 , top: 8 , right: 10 ,left: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.network( img, width: 50,height: 70,fit: BoxFit.cover,),
          ),
          const SizedBox(width: 20,),
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title ,style: TextStyleMethods.lightFontStyle(),overflow: TextOverflow.ellipsis,),
                Text(author, style: TextStyleMethods.lightDetailsFontStyle(),overflow: TextOverflow.ellipsis,),
              ],

            ),
          )



        ],

      ),
    );


  }
}
