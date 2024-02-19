import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopsync/components/my_button.dart';

import 'package:shopsync/components/my_textfield.dart';
import 'package:shopsync/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  // register method
  void registerUser() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // make sure password match
    if (passwordController.text != confirmPwController.text) {
      //pop loading circle
      Navigator.pop(context);
      // show error message
      displayMessageToUser("Passwords don't match!", context);
    }
    // if passwords match

    else {
      // try creating the user
      try {
        //create the user
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // pop loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading circle
        Navigator.pop(context);

        // display error message to user
        displayMessageToUser(e.code, context);
      }
    }

    //
  }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(Icons.local_grocery_store,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary),

                const SizedBox(height: 50),

                // app name
                const Text("S H O P S Y N C", style: TextStyle(fontSize: 20)),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign up & easily access shopsync services",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary)),
                  ],
                ),
                const SizedBox(height: 30),

                // username textfield
                MyTextField(
                  hintText: "Username",
                  obsecureText: false,
                  controller: usernameController,
                ),
                const SizedBox(height: 10),

                MyTextField(
                  hintText: "Email",
                  obsecureText: false,
                  controller: emailController,
                ),
                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  hintText: "Password",
                  obsecureText: true,
                  controller: passwordController,
                ),

                const SizedBox(height: 10),

                //confirm password textfield
                MyTextField(
                  hintText: "Confirm Password",
                  obsecureText: true,
                  controller: confirmPwController,
                ),

                const SizedBox(height: 10),

                // forgot password

                // register button
                MyButton(
                  text: "Register",
                  onTap: registerUser,
                ),

                const SizedBox(height: 25),

                // don't have an account? Register here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        " Login Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
