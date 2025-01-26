import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/constants/gaps.dart';
import 'package:onboarding/constants/sizes.dart';
import 'package:onboarding/widgets/button.dart';
import 'package:onboarding/widgets/display_message.dart';

class InterestScreenSecond extends StatefulWidget {
  const InterestScreenSecond({super.key});

  @override
  State<InterestScreenSecond> createState() => _InterestScreenSecondState();
}

class _InterestScreenSecondState extends State<InterestScreenSecond> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';
  bool _isObsecureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(
      () {
        setState(() {
          _password = _passwordController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_password.isEmpty || !_isPasswordValid()) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InterestScreenSecond(),
      ),
    );
  }

  void _onObsecureTap() {
    setState(() {
      _isObsecureText = !_isObsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              DisplayMessage(
                title: "What do you want to see on Twitter?",
                description:
                    "Interests are used to personalize your experience and will be visible on your profile.",
              ),
              Expanded(child: Container()),
              Button(
                  text: 'Next',
                  onTapFunction: (context) => {},
                  isDisabled: true),
              Gaps.v20,
            ],
          ),
        ),
      ),
    );
    ;
  }
}
