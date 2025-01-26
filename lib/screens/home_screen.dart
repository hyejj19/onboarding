import 'package:flutter/material.dart';
import 'package:onboarding/constants/sizes.dart';
import 'package:onboarding/screens/confirmation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onTapSignup(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ConfirmationScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _onTapSignup(context),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    padding: EdgeInsets.all(Sizes.size10),
                    color: Colors.blue,
                    child: Text(
                      '가입하기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
