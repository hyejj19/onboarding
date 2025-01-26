import 'package:flutter/material.dart';
import 'package:onboarding/constants/sizes.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function(BuildContext) onTapFunction;
  final bool isDisabled;

  const Button({
    super.key,
    required this.text,
    required this.onTapFunction,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapFunction(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.all(Sizes.size20),
          decoration: BoxDecoration(
              color: isDisabled ? Colors.grey.shade600 : Colors.black,
              borderRadius: BorderRadius.circular(40)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: isDisabled ? Colors.grey.shade500 : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
