import 'package:flutter/material.dart';
import 'package:onboarding/constants/sizes.dart';

class InterestChip extends StatelessWidget {
  final String interest;
  final bool isSelected;
  final Function onTap;

  const InterestChip({
    super.key,
    required this.interest,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size10,
          horizontal: Sizes.size20,
        ),
        decoration: BoxDecoration(
            color: isSelected ? Colors.blue : null,
            border: Border.all(
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(Sizes.size20)),
        child: Text(
          interest,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
