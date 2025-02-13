import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'dart:html' as html;

import '../../../../design/constants/app_animations.dart';
import '../../../../design/constants/app_images.dart';
import '../../../../design/utils/app_colors.dart';

class IntroDesktopWidget extends StatelessWidget {
  const IntroDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width / 30),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 250),
              Row(
                children: [
                  CircleAvatar(
                    radius: width / 14,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: width / 14 - 4,
                      backgroundImage: const AssetImage(AppImages.selfImage),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Preah',
                                fontSize: width / 40),
                            children: const [
                              TextSpan(text: 'Hi '),
                              TextSpan(
                                  text: '👋',
                                  style: TextStyle(color: AppColors.purple))
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Preah',
                                fontSize: width / 40),
                            children: const [
                              TextSpan(text: 'I am '),
                              TextSpan(
                                  text: 'Om Mishra ',
                                  style: TextStyle(color: AppColors.purple))
                            ]),
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
                      // RichText(
                      //   text: TextSpan(
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           height: 1.2,
                      //           fontFamily: 'Preah',
                      //           fontSize: w / 20,
                      //           fontWeight: FontWeight.bold),
                      //       children: [
                      //         const TextSpan(text: 'Crafting code to bring\n'),
                      //         const TextSpan(text: 'ideas to '),
                      //         TextSpan(
                      //             text: 'life',
                      //             style: TextStyle(color: AppColors.purple)),
                      //         const TextSpan(text: '...')
                      //       ]),
                      // ),
                      // const Text(
                      //     'Because if the cover does not impress you what else can?'),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "An Engineering Student &",
                    style: TextStyle(
                        color: Colors.white,
                        height: 1.2,
                        fontFamily: 'Preah',
                        fontSize: width / 28),
                  ),
                  SizedBox(
                    width: width * .7,
                    child: RichText(
                      softWrap: true,
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.white,
                              height: 1.2,
                              fontFamily: 'Preah',
                              fontSize: width / 44,
                              fontWeight: FontWeight.bold),
                          children: const [
                            TextSpan(
                                text: ' a Flutter Developer',
                                style: TextStyle(
                                    backgroundColor: Colors.yellowAccent,
                                    color: Colors.black)),
                            TextSpan(
                                text: ' crafting intuitive apps & exploring AI')
                          ]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                              scale: 6,),
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
                              scale: 17,),
                          )
                      ),

                    ],
                  )
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
                height: width * .16,
                width: width * .16,
                child: GestureDetector(
                    onTap: (){
                      html.window.open("https://bouncyballs.org/", '_blank');
                    },
                    child: const RiveAnimation.asset(AppAnimations.cat))),
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
        iconColor: Colors.white,
        link: link,
      ),
    );
  }
}
