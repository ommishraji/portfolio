import 'package:flutter/material.dart';

import '../../../../design/constants/app_constants.dart';
import '../../../../design/utils/app_colors.dart';
import '../../../../design/widgets/app_image_widget.dart';

class SkillsDesktopWidget extends StatelessWidget {
  const SkillsDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'Preah', fontSize: 24),
                  children: [
                    const TextSpan(
                        text:
                            'My expertise lies in building dynamic, '),
                    TextSpan(
                        text: 'user-centric applications \n',
                        style: TextStyle(color: AppColors.purple)),
                    const TextSpan(
                        text:
                            'by leveraging modern technologies and innovative solutions.'),
                  ]),
            ),
            const SizedBox(height: 20),
            const Text(
              "As a Flutter Developer and Engineering Student, I have worked on various projects, integrating features like Firebase, Google Maps, AI APIs, and Agora for video calling. I have interned as a Flutter Developer, gaining hands-on experience in mobile development and problem-solving. Additionally, I am actively exploring digital product monetization to expand my entrepreneurial skills",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        7,
                        (index) => techStackCircle(
                            techStackImages.values.toList()[index]))),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        6,
                        (index) => techStackCircle(techStackImages.values
                            .toList()
                            .reversed
                            .toList()[index])))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget techStackCircle(String imagePath) {
    return Container(
      margin: const EdgeInsets.all(6),
      height: 54,
      width: 54,
      padding: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: AppColors.violet),
      child: AppImageWidget(
        path: imagePath,
      ),
    );
  }
}
