import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/constants/gaps.dart';
import 'package:onboarding/constants/sizes.dart';
import 'package:onboarding/screens/interest_screen_second.dart';
import 'package:onboarding/widgets/button.dart';
import 'package:onboarding/widgets/display_message.dart';
import 'package:onboarding/widgets/interest_card.dart';

class InterestScreenFirst extends StatefulWidget {
  const InterestScreenFirst({super.key});

  @override
  State<InterestScreenFirst> createState() => _InterestScreenFirstState();
}

class _InterestScreenFirstState extends State<InterestScreenFirst> {
  final List<String> _interests = [
    'Fashion & beauty',
    'Arts & culture',
    'Business & finance',
    'Travle',
    'Music',
    'Outdoors',
    'Animation & comics',
    'Food',
    'Entertainment',
    'Gaming',
  ];

  List<String> _selected = [];

  void _onTapCard(String interest) {
    setState(() {
      if (_selected.contains(interest)) {
        _selected.remove(interest);
      } else {
        _selected.add(interest);
      }
    });
  }

  void _onTapNext(BuildContext context) {
    if (_selected.length < 3) return;

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
              SizedBox(
                height: 450,
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _interests
                              .sublist(0, _interests.length ~/ 2)
                              .map((interest) {
                            return InterestCard(
                              text: interest,
                              isSelected: _selected.contains(interest),
                              onTap: () => _onTapCard(interest),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _interests
                              .sublist(_interests.length ~/ 2)
                              .map((interest) {
                            return InterestCard(
                              text: interest,
                              isSelected: _selected.contains(interest),
                              onTap: () => _onTapCard(interest),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: Container()),
              Row(
                children: [
                  Expanded(
                    child: Text('${_selected.length} of 3 selected'),
                  ),
                  Expanded(
                    child: Button(
                      text: 'Next',
                      onTapFunction: _onTapNext,
                      isDisabled: _selected.length < 3,
                    ),
                  ),
                ],
              ),
              Gaps.v20,
            ],
          ),
        ),
      ),
    );
    ;
  }
}
