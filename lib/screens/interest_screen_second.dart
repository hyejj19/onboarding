import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/constants/gaps.dart';
import 'package:onboarding/constants/sizes.dart';
import 'package:onboarding/widgets/button.dart';
import 'package:onboarding/widgets/display_message.dart';
import 'package:onboarding/widgets/interest_chip.dart';

class InterestScreenSecond extends StatefulWidget {
  const InterestScreenSecond({super.key});

  @override
  State<InterestScreenSecond> createState() => _InterestScreenSecondState();
}

class _InterestScreenSecondState extends State<InterestScreenSecond> {
  final List<String> music = [
    "Pop",
    "Rock",
    "Hiphop",
    "Country",
    "Classical",
    "Jazz",
    "Electronic",
    "Rhythm and Blues",
    "Rock and Metal",
    "Composer",
    "Conductor",
    "Performer",
    "Singer",
    "Melody",
    "Rhythm",
  ];

  final List<String> entertainment = [
    "Anime",
    "Movies & TV",
    "Harry Potter",
    "Marvel Universe",
    "Movie News",
    "K-Drama",
    "Streaming Platforms",
    "Stand-up Comedy",
    "Theater & Plays",
    "Celebrity Gossip",
    "Award Shows",
    "Documentaries",
    "Classic Movies",
    "Cartoons & Animation",
    "Independent Films",
  ];

  final List<String> food = [
    "Italian Cuisine",
    "Street Food",
    "Vegan Recipes",
    "Desserts",
    "Seafood",
    "Healthy Eating",
    "BBQ & Grilling",
    "Baking",
    "Spices & Herbs",
    "Exotic Fruits",
    "Fast Food",
    "Traditional Dishes",
    "Fine Dining",
    "Food Festivals",
    "Cooking Tips",
  ];

  final Set<String> _selectedInterests = {};

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
            child: Column(
              children: [
                DisplayMessage(
                  title: "What do you want to see on Twitter?",
                  description:
                      "Interests are used to personalize your experience and will be visible on your profile.",
                ),
                Column(
                  children: [
                    _buildCategorySection('Music', music),
                    _buildCategorySection('Entertainment', entertainment),
                    _buildCategorySection('Food', food),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      child: Button(
                        text: 'Next',
                        onTapFunction: (context) {},
                        isDisabled: _selectedInterests.length < 3,
                      ),
                    ),
                  ],
                ),
                Gaps.v20,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection(String title, List<String> interests) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FractionallySizedBox(
          widthFactor: 1,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Gaps.v20,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: size.width * 2,
            child: Wrap(
              runSpacing: Sizes.size10,
              spacing: Sizes.size10,
              children: [
                for (var item in interests)
                  InterestChip(
                    interest: item,
                    isSelected: _selectedInterests.contains(item),
                    onTap: () => _onInterestTap(item),
                  ),
              ],
            ),
          ),
        ),
        Gaps.v36,
      ],
    );
  }

  void _onInterestTap(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
    });
  }
}
