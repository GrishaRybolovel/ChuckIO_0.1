import 'dart:convert';

import 'package:chuck_norris_io/pages/saved.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:chuck_norris_io/utils/jokes_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  JokesList storage = JokesList([]);

  String joke =
      'When Chuck Norris was in the Air Force, everyone, even the generals, saluted him first.';

  void getTheJoke() async {
    var searchResult =
        await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
    var decoded = json.decode(searchResult.body)['value'];

    setState(() {
      joke = decoded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChuckNorris.io'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
              ClipOval(
                  child: Material(
                      color: Colors.transparent,
                      child: Ink.image(
                        image: AssetImage('assets/chuck.jpeg'),
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => SavedPage(jl: storage)));
                          }
                        ),
                      )
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text("Hi, I'm Chuck Norris and I'll tell you some of my jokes"),
              Padding(padding: EdgeInsets.only(top: 150)),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                width: 300,
                //color: Colors.blue,
                child: Text(
                  joke,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              ElevatedButton(
                  onPressed: () {
                    storage.list.add(joke);
                  },
                  child: Icon(Icons.save))
            ],
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            getTheJoke();
          });
        },
      ),
    );
  }
}
