import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  // Handle photo click
                  print('Photo clicked!');
                },
                // Inside the GestureDetector for the photo
                child: AspectRatio(
                    aspectRatio:
                        1.0, // Set the aspect ratio to 1.0 for a square shape
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Color(0xFFBEEF00)),
                        //borderRadius: BorderRadius.circular(10), //<-- SEE HERE
                      ),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60',
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              title: GestureDetector(
                onTap: () {
                  print(
                    'Text clicked!',
                  );
                },
                child: Text(
                  'Gorgeous Girl',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
