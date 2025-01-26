import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/constants/gaps.dart';
import 'package:onboarding/constants/sizes.dart';
import 'package:onboarding/screens/interest_screen_first.dart';
import 'package:onboarding/widgets/button.dart';
import 'package:onboarding/widgets/display_message.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';
  bool _isObsecureText = true;
  bool _isDisabled = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(
      () {
        setState(() {
          _password = _passwordController.text;
          _isDisabled = _password.length < 8;
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
        builder: (context) => PasswordScreen(),
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
      builder: (context) => InterestScreenFirst(),
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
                title: "You'll need a password",
                description: "Make sure it's 8 characters or more. ",
              ),
              TextField(
                controller: _passwordController,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                obscureText: _isObsecureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: _onObsecureTap,
                        child: _isObsecureText
                            ? FaIcon(
                                FontAwesomeIcons.eyeSlash,
                                color: Colors.grey.shade400,
                                size: Sizes.size20,
                              )
                            : FaIcon(
                                FontAwesomeIcons.eye,
                                color: Colors.grey.shade400,
                                size: Sizes.size20,
                              ),
                      ),
                      Gaps.h10,
                      _isDisabled
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Expanded(child: Container()),
              Button(
                  text: 'Next',
                  onTapFunction: _onTapNext,
                  isDisabled: _isDisabled),
              Gaps.v20,
            ],
          ),
        ),
      ),
    );
    ;
  }
}
