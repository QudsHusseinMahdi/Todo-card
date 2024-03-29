 // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allTodos;
  final int allCompleted;

  const Counter({Key? key, required this.allCompleted, required this.allTodos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
 padding: const EdgeInsets.only(top: 27),
      child: Text("$allCompleted/$allTodos",
          style: TextStyle(
              fontSize: 44,
               color: allCompleted == allTodos ?   Color.fromARGB(255, 16, 229, 144)  :  Colors.white, 
               
               fontWeight: FontWeight.bold)),
    );
  }
}