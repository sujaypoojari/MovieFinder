import 'package:flutter/material.dart';

class displayResult extends StatefulWidget {
  final map;
  displayResult(this.map);

  @override
  _displayResultState createState() => _displayResultState();
}

class _displayResultState extends State<displayResult> {
  String title,
      year,
      poster,
      runtime,
      director,
      imdbRating,
      boxoffice,
      country,
      actors,
      plot;

  var response;

  @override
  void initState() {
    super.initState();
    setState(() {
      title = widget.map['Title'];
      year = widget.map['Released'];
      poster = widget.map['Poster'];
      runtime = widget.map['Runtime'];
      director = widget.map['Director'];
      imdbRating = widget.map['imdbRating'];
      boxoffice = widget.map['BoxOffice'];
      country = widget.map['Country'];
      actors = widget.map['Actors'];
      plot = widget.map['Plot'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 500,
      child: SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Container(
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network("$poster", height: 300, width: 300),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text(
                      "Title :$title",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Release Year:$year",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Runtime : $runtime",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Director : $director",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Boxoffice : $boxoffice",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Country : $country",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Actors : $actors",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Plot : $plot",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
