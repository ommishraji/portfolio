import 'package:flutter/material.dart';
import 'package:social_media_flutter/widgets/icons.dart';
import 'package:social_media_flutter/widgets/text.dart';
import 'dart:html' as html;
import '../../../../design/constants/app_images.dart';
import '../../../../design/utils/app_colors.dart';

class ContactUsMobileWidget extends StatefulWidget {
  const ContactUsMobileWidget({super.key});

  @override
  State<ContactUsMobileWidget> createState() => _ContactUsMobileWidgetState();
}

class _ContactUsMobileWidgetState extends State<ContactUsMobileWidget> {

  void openEmail() {
    String email = "ommishrapk@gmail.com";
    String subject = Uri.encodeComponent("Hello from your portfolio!");
    String body = Uri.encodeComponent("Hi, I found your portfolio and would like to connect with you.");

    String mailtoLink = "mailto:$email?subject=$subject&body=$body";

    html.window.open(mailtoLink, "_self");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Contact Me',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        const Text(
            "If want to hire me for mobile app development, website development, or just want to chat, drop your mail at 👇"),
        const SizedBox(height: 8),
        Text(
          'ommishrapk@gmail.com',
          style: TextStyle(color: AppColors.purple),
        ),
        const SizedBox(height: 20),
        SizedBox(
          child: Row(
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
            ],
          ),
        ),
        const Divider(),
        const SizedBox(height: 20),
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Coded with ♥️ in India'),
            ],
          ),
        )
      ]),
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
