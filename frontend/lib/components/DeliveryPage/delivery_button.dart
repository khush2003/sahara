import 'package:flutter/material.dart';




Widget deliveryMenuButton(String label, bool isShown){
  return    Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 4,
      vertical: 8
    ),
    child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent
       
          ),
          onPressed: (){
          },
          child: Text(label,style: const TextStyle(fontWeight: FontWeight.bold),)),
  );

}



