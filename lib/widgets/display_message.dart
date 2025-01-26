import 'package:flutter/material.dart';
import 'package:onboarding/constants/gaps.dart';
import 'package:onboarding/constants/sizes.dart';

class DisplayMessage extends StatelessWidget {
  final String title;
  final String description;

  const DisplayMessage({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v20,
          Text(
            title,
            style: const TextStyle(
              fontSize: Sizes.size28,
              fontWeight: FontWeight.w900,
            ),
          ),
          Gaps.v20,
          Text(
            description,
            style: const TextStyle(
              fontSize: Sizes.size16,
              color: Colors.black87,
            ),
          ),
          Gaps.v40,
        ],
      ),
    );
  }
}
