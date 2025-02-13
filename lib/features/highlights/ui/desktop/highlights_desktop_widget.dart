import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../design/constants/app_animations.dart';
import '../../../../design/utils/app_colors.dart';
import '../../../../design/widgets/buttons/app_outlined_button.dart';

class HighlightsDesktopWidget extends StatelessWidget {
  const HighlightsDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      // height: MediaQuery.of(context).size.height - 100,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
                BoxShadow(
                  blurRadius: 200,
                  spreadRadius: 200,
                  color: AppColors.purple.withOpacity(0.4),
                )
              ]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Highlights',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 40),
              Wrap(
                runSpacing: 20,
                spacing: 20,
                direction: Axis.horizontal,
                children: [
                  highlightContainer(
                      context,
                      false,
                      'Intern @Inventics',
                      AppAnimations.work2,
                      'Working at Inventics Software Pvt. Ltd. as a Flutter Developer Intern ',
                      'VISIT CHANNEL'),
                  highlightContainer(
                      context,
                      false,
                      'Ex-Intern @Seqtto',
                      AppAnimations.work1,
                      'Worked at Seqtto Software Solutions as Mobile Developer Intern ',
                      'VISIT CHANNEL'),
                  highlightContainer(
                      context,
                      false,
                      'Freelancer',
                      AppAnimations.freelance,
                      'I have worked on some freelance projects like School Fee Management Application ',
                      'VISIT CHANNEL'),
                  highlightContainer(
                      context,
                      false,
                      'AI Enthusiast',
                      AppAnimations.ai,
                      "I am working on a project including AI integration & Image Reorganization",
                      'VISIT CHANNEL'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget highlightContainer(BuildContext context, bool showButton, String topic,
      imagePath, text, buttonText) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w / 2.4,
      height: 260,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.purpleDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Lottie.network(imagePath,
          width: 180,
          height: 180),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic,
                  style: const TextStyle(
                      fontSize: 26, height: 1.4, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontSize: w / 80),
                ),
                const SizedBox(height: 10),
                if (showButton)
                  AppOutlinedButton(
                    title: buttonText,
                    textStyle: const TextStyle(fontSize: 12),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
