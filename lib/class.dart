import 'dart:ui';
import 'package:flutter/material.dart';

class MyClass {

  static var myFont = "Playpen";
  static var mycolor= Colors.redAccent;
}


class MyButton extends StatelessWidget {

  //3c308f
  String title;
  dynamic onTap;

  MyButton({
    required this.title,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        // alignment:Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 35),
        decoration: BoxDecoration(
            color:Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),



            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_checkout_outlined,size: 25,color: Colors.white,),
                Text(
                  "${title}",
                  style:TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: MyClass.myFont,
                      fontWeight: FontWeight.bold
                  ),
                  // textAlign: TextAlign.center,
                          ),
              ],
            ),


      ),
    );
  }
}

