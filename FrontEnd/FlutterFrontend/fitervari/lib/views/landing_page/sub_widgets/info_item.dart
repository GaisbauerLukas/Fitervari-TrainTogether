import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  InfoItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO change to dynamic strategy
      width: 350,
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  this.imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 5,
                right: 10,
                left: 10,
                child: ClipRRect(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 1,
                      width: 350,
                      color: Colors.white,
                    ),
                    Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Text(
                        this.title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
