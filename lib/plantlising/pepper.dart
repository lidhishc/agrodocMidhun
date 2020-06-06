import 'package:flutter/material.dart';
import 'camera.dart';

class Pepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('ADRO DOC',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Montserrat',
                  color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 55.0,
                bottom: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 10.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/good.jpg'),
                          fit: BoxFit.cover)),
                  height: 200.0,
                  width: 200.0,
                ),
              ),
              Positioned(
                top: 225.0,
                left: 25.0,
                //right: 25.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('PEPPER',
                        style: TextStyle(
                            fontFamily: 'cursive',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          height: 15.0,
                          minWidth: 350.0,
                          color: Color(0xFF7A9BEE),
                          highlightColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Take the picture of leaf',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            //take camera
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Camera(
                                        plantName: "pepper",
                                      )),
                            );
                          },
                        ),
                        MaterialButton(
                          height: 15.0,
                          minWidth: 350.0,
                          color: Color(0xFF7A9BEE),
                          highlightColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Common diseases',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            //tgo to common
                            //Navigator.push(context,
                            // MaterialPageRoute(builder: (context) => CarrotDise()),
                            // );
                          },
                        ),
                        MaterialButton(
                          height: 15.0,
                          minWidth: 350.0,
                          color: Color(0xFF7A9BEE),
                          highlightColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Climate',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            //go to climate
                          },
                        ),
                        MaterialButton(
                          height: 15.0,
                          minWidth: 350.0,
                          color: Color(0xFF7A9BEE),
                          highlightColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Method to grow',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            //go to metod to grow
                          },
                        ),
                        MaterialButton(
                          height: 15.0,
                          minWidth: 350.0,
                          color: Color(0xFF7A9BEE),
                          highlightColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Types',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            //go to type
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ])
          ]),
        ));
  }
}
