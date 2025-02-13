import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop/intro_desktop_widget.dart';
import 'mobile/intro_mobile_widget.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      tablet: (context) {
        return const IntroMobileWidget();
      },
      desktop: (context) {
        return const IntroDesktopWidget();
      },
      mobile: (context) {
        return const IntroMobileWidget();
      },
    );
  }
}
