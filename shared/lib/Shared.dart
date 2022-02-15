// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Shared extends StatefulWidget {
  const Shared({Key? key,}) : super(key: key);


  @override
  _SharedState createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
    _incrementCounter();
  }

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }
  void remove()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('counter');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('shared preferences'),centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '',
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 150,color: Colors.black,fontWeight: FontWeight.w600)
            ),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: ElevatedButton(onPressed: (){remove();}, child:Text('Reset')),
            )
          ],
        ),
      ),
       
    );
  }
}