import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:trivo/helper/helper_size.dart';
import 'package:trivo/database/functions/Firebase/db_repository.dart';
import 'package:trivo/screens/screen_login.dart';
import 'package:trivo/widgets/w_bottomnavbar.dart';

// ignore: must_be_immutable
class GetStarted extends StatelessWidget {
  GetStarted({super.key, required this.logedin});

  bool logedin;

  check(context) async {
    if (logedin) {
      await Future.delayed(const Duration(seconds: 4));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Navbar()),
          (route) => false);
    } else {
      Repository().getRandomDestinations();
      await Future.delayed(const Duration(seconds: 4));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    check(context);
    size(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Align(
          alignment: const Alignment(0.0, 0.0),
          child: Column(
            children: [
              const SizedBox(
                height: 190,
              ),
              const Expanded(
                  child: RiveAnimation.asset(
                'assets/4523-9190-moving-car.riv',
                fit: BoxFit.contain,
              )),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Travisor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
              ),
              const Text('The world at your finger tips.'), 
              const SizedBox( 
                height: 12,
              ),
              gap,
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
