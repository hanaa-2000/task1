import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:task1/screens/add_api.dart';
import 'package:task1/services/api_http.dart';

import '../models/actors_model.dart';

class ListActors extends StatefulWidget {
  const ListActors({super.key});

  @override
  State<ListActors> createState() => _HomeState();
}

class _HomeState extends State<ListActors> {
  Future<List<ActorsModel>>? actorsList;

  //  getActorsList()async{
  //
  // ApiHttp.getActors().then((respond) {
  //    setState(() {
  //      Iterable list = json.decode(respond.body);
  //
  //      actorsList = list.map((model)=>ActorsModel.fromJson(model)).toList();
  //    });
  //
  //    },);
  //  }

  @override
  void initState() {
    // getActorsList();
    super.initState();
    setState(() {
      actorsList = ApiHttp.fetchDataActors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<ActorsModel>>(
              future: actorsList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              title: Text(
                                snapshot.data![i].name!,
                              ),
                            );
                          }));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error::::${snapshot.error}"),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddApi(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
