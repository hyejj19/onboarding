import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/constants/gaps.dart';
import 'package:onboarding/constants/sizes.dart';
import 'package:onboarding/screens/interest_screen_second.dart';
import 'package:onboarding/widgets/button.dart';
import 'package:onboarding/widgets/display_message.dart';

class InterestScreenFirst extends StatefulWidget {
  const InterestScreenFirst({super.key});

  @override
  State<InterestScreenFirst> createState() => _InterestScreenFirstState();
}

class _InterestScreenFirstState extends State<InterestScreenFirst> {
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
        builder: (context) => InterestScreenFirst(),
      ),
    );
  }

  void _onObsecureTap() {
    setState(() {
      _isObsecureText = !_isObsecureText;
    });
  }

  void _onTapNext(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => InterestScreenSecond(),
    ));
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
                    "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
              ),
              Expanded(child: Container()),
              Button(text: 'Next', onTapFunction: _onTapNext),
              Gaps.v20,
            ],
          ),
        ),
      ),
    );
    ;
  }
}
