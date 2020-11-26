import 'package:fitervari/contracts/transfer/news_letter.dart';
import 'package:fitervari/logic/helper/session_info.dart';
import 'package:flutter/material.dart';

class NewsLetterDetailsPage extends StatelessWidget {
  static const String routeName = '/newsletter_details_page';

  NewsLetter _newsLetter;

  @override
  Widget build(BuildContext context) {
    this._newsLetter = ModalRoute.of(context).settings.arguments as NewsLetter;

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height -
                        SessionInfo().actionBarHeight) *
                    0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  //TODO add on click open a page to select another picture
                  image: DecorationImage(
                      image: NetworkImage(_newsLetter.imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  _newsLetter.title,
                  style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.height -
                              SessionInfo().actionBarHeight) *
                          0.04),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 3,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: (MediaQuery.of(context).size.height -
                            SessionInfo().actionBarHeight) *
                        0.4,
                    width: double.infinity,
                    child: Text(
                      _newsLetter.body,
                      style: TextStyle(
                          fontSize: (MediaQuery.of(context).size.height -
                                  SessionInfo().actionBarHeight) *
                              0.04),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
