import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home,size: 50,),
            Text("Home")
          ],
        ),
      ),
    );
  }
}