
import 'package:flutter/material.dart';

void showLoader(BuildContext context){
  showDialog(
      context: context,
       barrierDismissible: false,
       builder:(c){
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  child: CircularProgressIndicator()
              ),
              SizedBox(height: 20,),
              Text("LOADING...")
            ],
          ),
        );

       }
  //      CircularProgressIndicator(),
   );
}