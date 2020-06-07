import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    'https://i.ytimg.com/vi/cpM0aCzQ0FE/maxresdefault.jpg',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
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
                              'TEST',
                              style:
                                  TextStyle(fontSize: 26, color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
