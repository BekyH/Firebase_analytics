import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
const ProfilePage({ Key? key }) : super(key: key);

  @override
   Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person ,size: 50,),
            Text("Profile")
          ],
        ),
      ),
    );
  }
}