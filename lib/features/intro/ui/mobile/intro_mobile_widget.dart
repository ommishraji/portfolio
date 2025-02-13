import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'dart:html' as html;
import '../../../../design/constants/app_animations.dart';
import '../../../../design/constants/app_images.dart';
import '../../../../design/utils/app_colors.dart';

class IntroMobileWidget extends StatelessWidget {
  const IntroMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                      height: width * .2,
                      width: width * .2,
                      child: GestureDetector(
                          onTap: (){
                            html.window.open("https://bouncyballs.org/", '_blank');
                          },
                          child: const RiveAnimation.asset(AppAnimations.cat))),
                ),
                SizedBox(height: 70,),
                Align(
                  // alignment: Alignment.centerLeft,
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 66,
                      backgroundImage: AssetImage(AppImages.selfImage),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Preah',
                          fontSize: 24,
                          height: 1),
                      children: [
                        TextSpan(
                            text: 'Om Mishra ',
                            style: TextStyle(color: AppColors.purple))
                      ]),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialIcon(
                          'https://www.linkedin.com/in/om-mishra-0035a122b/',
                          SocialIconsFlutter.linkedin_box),
                      socialIcon('https://github.com/ommishraji',
                          SocialIconsFlutter.github),
                      GestureDetector(
                          onTap: (){
                            html.window.open('https://www.geeksforgeeks.org/user/ommishk5md/', '_blank');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(AppImages.GFGIcon,
                              scale: 7,),
                          )
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      socialIcon(
                          'https://www.youtube.com/channel/UCfcJMijytsNMrdDPJxlQ1zA',
                          SocialIconsFlutter.youtube),
                      socialIcon('https://www.instagram.com/ommishra.ji/',
                          SocialIconsFlutter.instagram),
                      GestureDetector(
                          onTap: (){
                            html.window.open('https://drive.google.com/file/d/1uG5YYxhXeoOH4CrY2USJcdXAswuTR8IE/view?usp=sharing', '_blank');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(AppImages.downloadIcon,
                              scale: 22,),
                          )
                      ),

                    ],
                  )
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                    html.window.open('https://drive.google.com/file/d/1uG5YYxhXeoOH4CrY2USJcdXAswuTR8IE/view?usp=sharing', '_blank');
                  },
                  child: const Text(
                    'A Flutter Developer,',
                    style: TextStyle(decoration: TextDecoration.underline,
                        fontSize: 16),
                  ),
                ),
                SizedBox(height: 5,),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: const TextStyle(
                          color: Colors.white,
                          height: 1.4,
                          fontFamily: 'Preah',
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                      children: [
                        const TextSpan(text: 'Turning caffeine into '),
                        const TextSpan(text: 'efficient '),
                        TextSpan(
                            text: 'code',
                            style: TextStyle(color: AppColors.purple)),
                        const TextSpan(text: '...')
                      ]),
                ),
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "An Engineering Student &",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Preah', fontSize: 16),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Preah',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: ' a Flutter Developer',
                                style: TextStyle(
                                    backgroundColor: Colors.yellowAccent,
                                    color: Colors.black)),
                            TextSpan(
                                text: ' crafting intuitive apps & exploring AI')
                          ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget socialIcon(String link, IconData iconPath) {
    return InkWell(
      onTap: () => html.window.open(link, '_blank'),
      child: SocialWidget(
        placeholderText: '',
        iconData: iconPath,
        iconSize: 20,
        iconColor: Colors.white,
        link: link,
      ),
    );
  }
}
