import 'package:flutter/material.dart';
import 'main.dart';

class MedData extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
       appBar: //the magic appbar can be applied to a Scaffold
        AppBar(title: Text('Medical Data'),
        actions: [
        IconButton(
          icon: Icon(Icons.search,color:Colors.white), 
          onPressed: (){}
          ),
        ],
        leading:
        IconButton(
          icon: Icon(Icons.arrow_back,color:Color(0xff61c198)), onPressed: (){
          }),
        backgroundColor: Color(0xff234499),
       
    ),
    body: SingleChildScrollView(
      child: Center(
        child:Column(
          children: <Widget>[
        
          SizedBox(height:15),

          Container(
          margin: EdgeInsets.all(5.0),
          child:Align(//jankey positioning
          alignment: AlignmentDirectional.bottomStart,
          child: Text("Recent",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Color(0xff61c198),
            fontSize: 20 ),
          )
            ),
          ),
          
          SizedBox(height: 15,),
          Container(
            width:double.infinity,
            height:3,
            color: Colors.grey
          ),
          SizedBox(height: 15,),

          Container(
          margin: EdgeInsets.all(5.0),
          child:Align(//jankey positioning
          alignment: AlignmentDirectional.bottomStart,
          child: Text("Medical Data",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Color(0xff234499),
            fontSize: 20 ),
          )
            ),
          ),

          Container(
          margin: EdgeInsets.all(5.0),
          child:Align(//jankey positioning
          alignment: AlignmentDirectional.bottomStart,
          child: Text("March 1 2021",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Color(0xff737373),
            fontSize: 15 ),
          )
            ),
          ),

          SizedBox(height: 15,),
          Container(
            width:double.infinity,
            height:3,
            color: Colors.grey
          ),
          SizedBox(height: 15,),

          Container(
          margin: EdgeInsets.all(5.0),
          child:Align(//jankey positioning
          alignment: AlignmentDirectional.bottomStart,
          child: Text("Medical Data",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Color(0xff234499),
            fontSize: 20 ),
          )
            ),
          ),

          Container(
          margin: EdgeInsets.all(5.0),
          child:Align(//jankey positioning
          alignment: AlignmentDirectional.bottomStart,
          child: Text("March 1 2020",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Color(0xff737373),
            fontSize: 15 ),
          )
            ),
          ),

            SizedBox(height: 15,),
          Container(
            width:double.infinity,
            height:3,
            color: Colors.grey
          ),
          SizedBox(height: 50,),

           Stack(children: [
           
           Container(
          margin: EdgeInsets.all(5.0),
          child:Align(//jankey positioning
          alignment: AlignmentDirectional.bottomStart,
          child: Text("Earlier",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Color(0xff61c198),
            fontSize: 20 ),
          )
            ),
          ),
           
          SizedBox(
        child:Align(//jankey positioning
              alignment: AlignmentDirectional.bottomEnd,
        child: TextButton(//this is a button type, flatbuttons are outdated
        style: ButtonStyle(//this is forr colorrs
        ),
        child: Text("See All",style: TextStyle(color:Colors.black,fontSize: 20),//textstyle is forr colors and fonts to make it bold or italic
        ),
        onPressed: () {}), 
        ),
          )
           ]
           ),

         
          Container(
            width:double.infinity,
            height:3,
            color: Colors.grey
          ),
          SizedBox(height: 15,),

          Container(
          margin: EdgeInsets.all(5.0),
          child:Align(//jankey positioning
          alignment: AlignmentDirectional.bottomStart,
          child: Text("Medical Data",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Color(0xff234499),
            fontSize: 20 ),
          )
            ),
          ),

          Container(
          margin: EdgeInsets.all(5.0),
          child:Align(//jankey positioning
          alignment: AlignmentDirectional.bottomStart,
          child: Text("March 1 2021",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Color(0xff737373),
            fontSize: 15 ),
          )
            ),
          ),

          SizedBox(height: 15,),
          Container(
            width:double.infinity,
            height:3,
            color: Colors.grey
          ),
          SizedBox(height: 15,),

          SizedBox(
          width: 150,
          height: 50,
        child: ElevatedButton(//this is a button type, flatbuttons are outdated
        style: ButtonStyle(//this is forr colorrs
        backgroundColor:MaterialStateProperty.all<Color>(Color(0xff234499))
        ),
        child: Text("Add Data",style: TextStyle(color:Colors.white),//textstyle is forr colors and fonts to make it bold or italic
        ),
        onPressed: () {}), 
        ),

          ]
    )
    )
    )
    )
    );
  }
}