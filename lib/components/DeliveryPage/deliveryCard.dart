import 'package:flutter/material.dart';



Widget inTransitCard(String itemName, String duration, int usability, int price, String user, String phone, int fee, String address, DateTime arrDate){
  return
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), 
              )
            ],
           border: Border.all(color: Colors.black),
           borderRadius: BorderRadius.circular(10),
           
          ),
          child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                
                  children: [
                   Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amberAccent,
                      image: DecorationImage(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))
                    ),
                     
                   ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            CardRowDesc('Name', itemName),
                            CardRowDesc('Used Duration', duration),
                            CardRowDesc('Usability', usability.toString() + '%'),
                            CardRowDesc('Price', "฿"+ price.toString())
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Black line seperating top inf and bottom info
              Container(
                height: 0.5,
                decoration: BoxDecoration(
                  color: Colors.black
                ),
              )
              ,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                          
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Delivery Information', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      CardRowDesc('Name', user),
                      CardRowDesc('Phone', phone),
                      CardRowDesc('Delivery Fee', "฿"+ fee.toString()),
                      CardRowDesc('Address', address),
                      CardRowDesc('Expected Arrival Date', arrDate.toString())
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

Widget CardRowDesc(String label, String input){ 
  
  return
  Padding(
    padding: const EdgeInsets.all(6.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label+ ': ', style: TextStyle(fontWeight: FontWeight.bold),),
        Expanded(child: Text(input))
      ],
    ),
  );
}

Widget toDeliverCard(String itemName, String duration, int usability, int price, String user, String phone, int fee, String address, DateTime arrDate){
  return
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), 
              )
            ],
           border: Border.all(color: Colors.black),
           borderRadius: BorderRadius.circular(10),
           
          ),
          child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                
                  children: [
                   Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amberAccent,
                      image: DecorationImage(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))
                    ),
                     
                   ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            CardRowDesc('Name', itemName),
                            CardRowDesc('Used Duration', duration),
                            CardRowDesc('Usability', usability.toString() + '%'),
                            CardRowDesc('Price', "฿"+ price.toString())
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Black line seperating top inf and bottom info
              Container(
                height: 0.5,
                decoration: BoxDecoration(
                  color: Colors.black
                ),
              )
              ,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                          
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Delivery Information', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      CardRowDesc('Name', user),
                      CardRowDesc('Phone', phone),
                      CardRowDesc('Delivery Fee', "฿"+ fee.toString()),
                      CardRowDesc('Address', address),
                      CardRowDesc('Pick Up Date', arrDate.toString())
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

Widget toReceiveCard(String itemName, String duration, int usability, int price, String user, String phone, int fee, String address, DateTime arrDate){
  return
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), 
              )
            ],
           border: Border.all(color: Colors.black),
           borderRadius: BorderRadius.circular(10),
           
          ),
          child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                
                  children: [
                   Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amberAccent,
                      image: DecorationImage(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))
                    ),
                     
                   ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            CardRowDesc('Name', itemName),
                            CardRowDesc('Used Duration', duration),
                            CardRowDesc('Usability', usability.toString() + '%'),
                            CardRowDesc('Price', "฿"+ price.toString())
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Black line seperating top inf and bottom info
              Container(
                height: 0.5,
                decoration: BoxDecoration(
                  color: Colors.black
                ),
              )
              ,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                          
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Delivery Information', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      CardRowDesc('Name', user),
                      CardRowDesc('Phone', phone),
                      CardRowDesc('Delivery Fee', "฿"+ fee.toString()),
                      CardRowDesc('Address', address),
                      CardRowDesc('Expected Arrival Date', arrDate.toString())
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

Widget deliveredCard(String itemName, String duration, int usability, int price, String user, String phone, int fee, String address, DateTime arrDate){
  return
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), 
              )
            ],
           border: Border.all(color: Colors.black),
           borderRadius: BorderRadius.circular(10),
           
          ),
          child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                
                  children: [
                   Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amberAccent,
                      image: DecorationImage(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))
                    ),
                     
                   ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            CardRowDesc('Name', itemName),
                            CardRowDesc('Used Duration', duration),
                            CardRowDesc('Usability', usability.toString() + '%'),
                            CardRowDesc('Price', "฿"+ price.toString())
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Black line seperating top inf and bottom info
              Container(
                height: 0.5,
                decoration: BoxDecoration(
                  color: Colors.black
                ),
              )
              ,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                          
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Delivery Information', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      CardRowDesc('Name', user),
                      CardRowDesc('Phone', phone),
                      CardRowDesc('Delivery Fee', "฿"+ fee.toString()),
                      CardRowDesc('Address', address),
                      CardRowDesc('Expected Arrival Date', arrDate.toString())
                  ],
                ),
              ),
               Container(
                height: 0.5,
                decoration: BoxDecoration(
                  color: Colors.black
                ),
              )
              ,
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(255, 199, 54, 1),
        ),
                    onPressed: (){
                      print('Review');
                    },
                   child: Padding(
                     padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16),
                     child: Text('Review',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                   )),
                ),
              )
            ],
          ),
        ),
      );
}

