// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:rive/rive.dart';
import 'package:trivo/database/functions/Firebase/authentication/db_authentication.dart';
import 'package:trivo/favourites/favourites_models.dart';
import 'package:trivo/helper/helper_size.dart';
import 'package:trivo/screens/admin/screens/admin_homepage.dart';
import 'package:trivo/screens/screen_signup.dart';
import 'package:trivo/widgets/w_bottomnavbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _gmailcontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Colors.white,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalGap6,
                verticalGap6,
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 150,
                        width: 500,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Navbar()));
                                },
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            verticalGap2,
                            verticalGap2,
                            const Text(''),
                            TextFormField(
                              controller: _gmailcontroller,
                              decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(98, 203, 204, 206),
                                  hintText: 'Gmail',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter valid gmail.';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            gap,
                            TextFormField(
                              controller: _passwordcontroller,
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(98, 203, 204, 206),
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter valid password.';
                                }
                                return null;
                              },
                              obscureText: true,
                            ),
                            gap,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                loading
                                    ? SizedBox(
                                        width: screenWidth * .46,
                                        height: 53,
                                        child: const RiveAnimation.asset(
                                            'assets/1326-2537-loading-dots.riv'),
                                      )
                                    : Container(
                                        decoration: const BoxDecoration(),
                                        width: screenWidth * .937,
                                        height: 53,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            _formkey.currentState!.validate();
                                            setState(() {
                                              loading = true;
                                            });
                                            await F_authentication()
                                                .signInWithEmailAndPassword(
                                                    _gmailcontroller.text,
                                                    _passwordcontroller.text,
                                                    context);
                                            setState(() {
                                              loading = false;
                                              currentUserId = FirebaseAuth
                                                  .instance.currentUser!.uid;
                                            });
                                          },
                                          style: ButtonStyle(
                                              elevation:
                                                  const MaterialStatePropertyAll(
                                                      0),
                                              backgroundColor:
                                                  const MaterialStatePropertyAll(
                                                      Color.fromARGB(
                                                          177, 10, 124, 162)),
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)))),
                                          child: const Text('Login'),
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 215,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Adminhome()));
                                },
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signUp()));
                                  },
                                  child: const Text(
                                    'Dont have an account? SignUp',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color:
                                            Color.fromARGB(177, 10, 124, 162),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
