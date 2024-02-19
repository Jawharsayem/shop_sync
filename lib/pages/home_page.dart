import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopsync/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0 
      ),
      drawer: MyDrawer(),
    );
  }
}
