import 'package:flutter/material.dart'; 
class History extends StatelessWidget {
  @override
  
 
  Widget build(BuildContext context) {
    //String _email;
    return  Scaffold(
   // resizeToAvoidBottomPadding: false,
      body:Center(
       
   
       
        child:SingleChildScrollView(
        child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:<Widget>[
          Container(
            child: Stack(
              children:<Widget>[
                Container(
                  padding:EdgeInsets.fromLTRB(15.0, 115.0, 0.0, 0.0),
                  child:Text(
                    'Hello',
                    style:TextStyle(
                      fontSize:80.0,fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Container(
                  padding:EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child:Text(
                    'There' ,
                     style:TextStyle(
                       fontSize:80.0,fontWeight: FontWeight.bold
                     )


                   ),
                ),
                Container(
                  padding:EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                  child:Text(
                  '.',
                   style:TextStyle(
                   fontSize:80.0,fontWeight: FontWeight.bold,color:Colors.green,
                   )
                   ),
                )
                   ],
            ),
          ),
          ],
          ),
        ),
      )
      );
        }
}