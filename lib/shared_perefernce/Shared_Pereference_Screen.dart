import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceScreen extends StatefulWidget {
  const SharedPreferenceScreen({super.key});

  @override
  State<SharedPreferenceScreen> createState() => _SharedPreferenceScreenState();
}

class _SharedPreferenceScreenState extends State<SharedPreferenceScreen> {
  String email = "";
  getCachedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email") ?? "--";
  }

  @override
  void initState() {
    getCachedEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(email,style: const TextStyle(fontSize: 40,),)),
    );
  }
}
