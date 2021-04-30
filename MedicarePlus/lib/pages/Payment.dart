import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(home: Scaffold(
    appBar: 
        AppBar(title: Text('Payment Method'),
        backgroundColor: Color(0xff234499),
        leading:
        IconButton(
          icon: Icon(Icons.arrow_back,color:Color(0xff61c198)), onPressed: (){
          })
        ),   
    body: SingleChildScrollView(//This allows to scrollz, this should be declared to larrge lists otherwise the rest of the list will not display and have errors
      child:Center(child: Column(
        mainAxisSize: MainAxisSize.max,
      
      children:[
         
         Container(
          margin: EdgeInsets.all(20.0),
          child:Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Text("Payment Method:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Color(0xff5db9ae),
            fontSize: 20 ),
            ),
          ),
          ),

      SizedBox(height:15),
        SizedBox(
          width: 350,
          height: 75,
        child: TextButton(
        
        style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all<Color>(Color(0xffeff2f8))
        ),
        
        child: Row(children: [
          Icon(Icons.credit_card,color:Color(0xff61c198),size: 50),
          SizedBox(width: 10,),
          
          Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Text("Paymet Method",style: TextStyle(color:Color(0xff234499))),
          Text("Master Card",style: TextStyle(color:Colors.black)),
          ],
          ),

          Spacer(flex:9),
          IconButton(
          icon: Icon(Icons.cancel_outlined,color:Color(0xff61c198)), 
          onPressed: (){}
          )
        ]
        ),
        onPressed: () {}), 
        ),
    
      SizedBox(height:15),
        SizedBox(
          width: 350,
          height: 75,
        child: TextButton(
        
        style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all<Color>(Color(0xffeff2f8))
        ),
        
        child: Row(children: [
          Icon(Icons.credit_card,color:Color(0xff61c198),size: 50),
          SizedBox(width: 10,),
          
          Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Text("Paymet Method",style: TextStyle(color:Color(0xff234499))),
          Text("Plan Card",style: TextStyle(color:Colors.black)),
          ],
          ),

          Spacer(flex:9),
          IconButton(
          icon: Icon(Icons.cancel_outlined,color:Color(0xff61c198)), 
          onPressed: (){}
          )
        ]
        ),
        onPressed: () {}), 
        ),

       SizedBox(height:15),
        SizedBox(
          width: 350,
          height: 75,
        child: TextButton(
        
        style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all<Color>(Color(0xffeff2f8))
        ),
        
        child: Row(children: [
          Icon(Icons.add,color:Color(0xff61c198),size: 50),
          SizedBox(width: 10,),
          Text("Add Paymet Method",style: TextStyle(color:Color(0xff234499))),
          Spacer(flex:9),
        ]
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