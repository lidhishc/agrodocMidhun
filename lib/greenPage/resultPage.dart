import 'package:flutter/material.dart';

class PlantScreen extends StatefulWidget {
  final String plant = "Tomato";

  //PlantScreen({this.plant});

  @override
  _PlantScreenState createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 60.0,
                  ),
                  height: 520.0,
                  color: Color(0xFF32A060),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Plant Name", // cat
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        widget.plant, // name
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Text(
                        'Scientific Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Solanum lycopersicum', //price
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40.0),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: <Widget>[
                      //     Hero(
                      //       tag: widget.plant, // url
                      //       child: Image(
                      //         height: 150.0,
                      //         width: 150.0,
                      //         image: AssetImage("assets/tomato.jfif"),
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      //SizedBox(height: 40.0),
                    ],
                  ),
                ),
                Positioned(
                  right: 20.0,
                  bottom: 100.0,
                  child: Hero(
                    tag: widget.plant, // url
                    child: Image(
                      height: 130.0,
                      width: 210.0,
                      image: AssetImage("assets/tomatob.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 400.0,
              width: 500.0,
              transform: Matrix4.translationValues(0.0, -60.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 40.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Predicted Disease',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Disease name', // description
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 40.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Solution',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '''Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1
                          Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1Apply 2 to 3 pounds of a complete fertilizer such as 5-10-5, 10-10-1
                          ''',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
