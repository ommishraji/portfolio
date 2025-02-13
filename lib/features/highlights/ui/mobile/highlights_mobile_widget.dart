import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../design/constants/app_animations.dart';
import '../../../../design/utils/app_colors.dart';
import '../../../../design/widgets/buttons/app_outlined_button.dart';

class HighlightsMobileWidget extends StatelessWidget {
  const HighlightsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      // height: MediaQuery.of(context).size.height,
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
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Wrap(
                runSpacing: 8,
                spacing: 8,
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
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
          color: AppColors.purpleDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.network(imagePath,
              width: 80,
              height: 80),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic,
                  style: const TextStyle(
                      height: 1.2, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  text,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
                if (showButton) const SizedBox(height: 10),
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
