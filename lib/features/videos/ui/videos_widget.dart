import 'package:flutter/material.dart';
import 'package:om_mishra_portfolio/features/videos/ui/tab/videos_tab_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop/videos_desktop_widget.dart';
import 'mobile/videos_mobile_widget.dart';

class ReposWidget extends StatelessWidget {
  const ReposWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (p0) => const ReposDesktopWidget(),
      mobile: (p0) => const ReposMobileWidget(),
      tablet: (p0) => const ReposTabWidget(),
    );
  }
}
