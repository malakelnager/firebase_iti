import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String email;
   SecondScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  const Center(child: Text('email',style: TextStyle(fontSize: 30,color: Colors.blue),)),
    );
  }
}
