import 'package:smarthome/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smarthome/src/screens/home_screen/home_screen.dart';
import 'package:smarthome/src/screens/login_success/login_success_screen.dart';
import 'package:smarthome/src/screens/sinup_page/sinup_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    Future<void> _signInWithEmailAndPassword() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // Handle successful login, e.g., navigate to a new page
      } on FirebaseAuthException catch (e) {
        // Handle login errors, e.g., show an error message
        if (e.code == 'user-not-found') {
          //wrongEmailMessage();
        } else if (e.code == 'wrong-password') {
          //wrongPasswordMessage();
        }
      }
    }

    // wrong email message popup
    void wrongEmailMessage() {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                'Incorrect Email',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }

    // wrong password message popup
    void wrongPasswordMessage() {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                'Incorrect Password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/login.png',
              height: getProportionateScreenHeight(300),
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
                bottom: getProportionateScreenHeight(20),
                left: getProportionateScreenWidth(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.black, fontSize: 33),
                    ),
                    Text(
                      'Login Page',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.black, fontSize: 64),
                    )
                  ],
                )),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'sign into \nmange your device & accessory',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70.0),
                ),
                hintText: 'Email',
                // validator: (String? value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please Enter Your Email';
                //   }
                //   return null;
                // },
                suffixIcon: const Icon(
                  Icons.email,
                  color: Colors.black,
                )),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70.0),
                ),
                hintText: 'Password',
                // validator: (String? value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please Enter Your Email';
                //   }
                //   return null;
                // },
                suffixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black,
                )),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: GestureDetector(
            onTap: () {
              _signInWithEmailAndPassword();
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => HomeScreen()));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginSuccessScreen()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF464646),
                borderRadius: BorderRadius.circular(70.0),
              ),
              child: const Text(
                'Welcome to Home',
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: GestureDetector(
            onTap: () {
              _signInWithEmailAndPassword();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignScreen(),
                  ));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(70.0),
              ),
              child: const Text(
                'Don\'t have an account yet?',
                style: TextStyle(color: Color.fromARGB(255, 7, 6, 6)),
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }
}
