import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  // logout user
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // Drawer header
          DrawerHeader(
            child: Icon(Icons.favorite,
                color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 25),

          // Home title
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.home,
                  color: Theme.of(context).colorScheme.primary),
              title: Text("H O M E"),
              onTap: () {
                // This is already the home screen so just pop drawer
                Navigator.pop(context);
              },
            ),
          ),

          // PROFILE TITTLE
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.home,
                  color: Theme.of(context).colorScheme.primary),
              title: Text(" P R O F I L E"),
              onTap: () {
                // This is already the home screen so just pop drawer
                Navigator.pop(context);
              },
            ),
          ),

          //USER TITTLE

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.home,
                  color: Theme.of(context).colorScheme.primary),
              title: Text("U S E R"),
              onTap: () {
                // This is already the home screen so just pop drawer
                Navigator.pop(context);
              },
            ),
          ),

          // Products tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text("P R O D U C T S"),
              onTap: () {
                // This is already the home screen so just pop drawer
                Navigator.pop(context);
              },
            ),
          ),

          // Purchase tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.receipt,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text("P U R C H A S E"),
              onTap: () {
                // This is already the home screen so just pop drawer
                Navigator.pop(context);
              },
            ),
          ),

          // Sale tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.request_page_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text("S A L E"),
              onTap: () {
                // This is already the home screen so just pop drawer
                Navigator.pop(context);
              },
            ),
          ),

          // Expense tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.price_change,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text("E X P E N S E"),
              onTap: () {
                // This is already the home screen so just pop drawer
                Navigator.pop(context);
              },
            ),
          ),

          // Report tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.edit_road,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text("R E P O R T"),
              onTap: () {
                // This is already the home screen so just pop drawer
                Navigator.pop(context);
              },
            ),
          ),

          const SizedBox(
            height: 50,
          ),

          // logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text("L O G O U T"),
              onTap: () {
                // pop drawer
                Navigator.pop(context);

                // logout
                logout();
              },
            ),
          ),
        ], // Close the children list
      ), // Close the Column widget
    ); // Close the Drawer widget
  }
}
