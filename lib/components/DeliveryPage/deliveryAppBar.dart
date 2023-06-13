import 'package:flutter/material.dart';
import 'package:sahara/components/DeliveryPage/deliveryButton.dart';
import 'package:sahara/views/test_james.dart';



Widget deliveryAppBar(){
  return
   Container(
    decoration: BoxDecoration(color: Color.fromRGBO(20, 29, 58, 1)),
    height: 60,
     child: ListView(
     
     scrollDirection: Axis.horizontal,
     children: <Widget>[
   
      // In-transit button
      deliveryMenuButton('In Transit', showInTransit),
        Padding(padding: EdgeInsets.all(8.0)),
      deliveryMenuButton('To Pick Up',showPickUp),
        Padding(padding: EdgeInsets.all(8.0)),
      deliveryMenuButton('To Deliver',showToDeliver),
        Padding(padding: EdgeInsets.all(8.0)),
      deliveryMenuButton('Delivered', showDelivered),
       Padding(padding: EdgeInsets.all(8.0)),
   
   
     ],
   ),
   );
}

AppBar newAppBar(){
  return AppBar(
    actions: [
      ListView(
     
     scrollDirection: Axis.horizontal,
     children: <Widget>[
   
      // In-transit button
      deliveryMenuButton('In Transit', showInTransit),
        Padding(padding: EdgeInsets.all(8.0)),
      deliveryMenuButton('To Pick Up',showPickUp),
        Padding(padding: EdgeInsets.all(8.0)),
      deliveryMenuButton('To Deliver',showToDeliver),
        Padding(padding: EdgeInsets.all(8.0)),
      deliveryMenuButton('Delivered', showDelivered),
       Padding(padding: EdgeInsets.all(8.0)),
   
   
     ],
   )
    ],
  );
}