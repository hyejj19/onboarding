import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/constants/gaps.dart';
import 'package:onboarding/constants/sizes.dart';

class InterestCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onTap;

  const InterestCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(Sizes.size3),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : null,
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(Sizes.size16),
            ),
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size10,
            ),
            child: Column(
              children: [
                Gaps.v48,
                Text(
                  text,
                  style: TextStyle(
                      fontSize: Sizes.size16,
                      color: isSelected ? Colors.white : Colors.black),
                ),
                Gaps.v10,
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              top: Sizes.size16,
              right: Sizes.size16,
              child: FaIcon(
                FontAwesomeIcons.solidCircleCheck,
                color: Colors.white,
                size: Sizes.size14,
              ),
            ),
        ],
      ),
    );
  }
}
