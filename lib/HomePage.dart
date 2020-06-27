import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_info/displayResult.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final String url = "";
  var result;
  var response;
  String _movieName;
  Map<String, dynamic> map;
  @override
  void dispose() {
    super.dispose();
    _textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Finder")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  labelText: 'Movie Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (movieName) {
                  if (movieName.isEmpty) return 'Enter a valid Movie name';
                },
                onSaved: (movieName) => _movieName = movieName,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)),
                padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  try {
                    if (_formKey.currentState.validate()) {
                      fetchData();
                    }
                  } catch (e) {
                    //do whatever you want
                    print("Error");
                  }
                },
                child: Text(
                  "Find",
                  style: TextStyle(fontSize: 21, color: Colors.black),
                )),
          ),
        ],
      )),
    );
  }

  alertWindow() {
    AlertDialog alert = AlertDialog(
        title: Text("Search Result"),
        content: Text("Movie not found"),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              return Navigator.of(context).pop();
            },
          )
        ]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future fetchData() async {
    _movieName = _textFieldController.text;
    try {
      response = await http.get(
          Uri.encodeFull("http://omdbapi.com/?apikey=b41a44a8+&t=$_movieName"),
          headers: {"Accept": "application/json"});
      map = json.decode(response.body);
      print(map['Title']);
      if (map['Title'] != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return displayResult(map);
        }));
      } else {
        alertWindow();
      }
    } catch (e) {
      print("Error");
      alertWindow();
    }
  }
}
