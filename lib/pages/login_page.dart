import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoggingIn = false;

  Future signIn() async{
    setState(() {
      isLoggingIn = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch(e) {
      print(e.message);
      print(e.code);
    }
    setState(() {
      isLoggingIn = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(
                //   Icons.thunderstorm_outlined,
                //   size: 15,
                //   color: Colors.orange,
                // ),
                Icon(
                  Icons.coffee,
                  size: 100,
                  color: Colors.orange,
                ),
                SizedBox(height: 25,),
                Text(
                  'Hello again!',
                  style: GoogleFonts.montserrat(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                    'Welcome back, you\'ve been missed.',
                    style: TextStyle(
                      fontSize: 17,
                    )
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[200]!,
                          width: 0.5
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 0.9
                        ),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Email',
                      // fillColor: Colors.grey[200],
                      // filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                // password field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.5,
                          color: Colors.grey[200]!,
                        ),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.9,
                          color: Colors.orange
                        ),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Password'
                    ),
                  )
                ),
                SizedBox(height: 10,),
                // sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: isLoggingIn ? CircularProgressIndicator(color: Colors.white) : Text(
                          'Sign In',
                           style: GoogleFonts.montserrat(
                             fontSize: 18,
                             fontWeight: FontWeight.bold
                           )
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),

                // don't have an account? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        ' Register now',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

        ),

      ),
    );
  }
}
