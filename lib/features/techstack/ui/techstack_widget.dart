import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop/techstack_desktop_widget.dart';
import 'mobile/techstack_mobile_widget.dart';

class TechStackWidget extends StatelessWidget {
  const TechStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (p0) => const SkillsDesktopWidget(),
      mobile: (p0) => const SkillsMobileWidget(),
    );
  }
}
