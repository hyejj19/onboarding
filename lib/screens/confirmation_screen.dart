import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/constants/gaps.dart';
import 'package:onboarding/constants/sizes.dart';
import 'package:onboarding/screens/password_screen.dart';
import 'package:onboarding/widgets/button.dart';
import 'package:onboarding/widgets/display_message.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  String _otpValue = '';
  bool _isDisabled = true;

  void _onFieldChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }

    setState(() {
      _otpValue = _controllers.map((controller) => controller.text).join('');
      _isDisabled = _otpValue.length < 4;
    });
  }

  void _onTapNext(BuildContext context) {
    if (_isDisabled) return;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PasswordScreen(),
    ));
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }

    super.dispose();
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
                title: 'We sent you a code',
                description: 'Enter it below to verify\njohn.mobbin@gmail.com.',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 70,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onChanged: (value) {
                        _onFieldChanged(value, index);
                      },
                    ),
                  );
                }),
              ),
              Gaps.v14,
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
              Expanded(child: Container()),
              Button(
                  text: 'Next',
                  isDisabled: _isDisabled,
                  onTapFunction: _onTapNext),
              Gaps.v20,
            ],
          ),
        ),
      ),
    );
    ;
  }
}
