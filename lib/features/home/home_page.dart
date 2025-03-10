import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rive/rive.dart' as rive;
import 'package:flutter/material.dart';
import '../../design/constants/app_animations.dart';
import '../contact_us/ui/contact_us_widget.dart';
import '../highlights/ui/highlights_widget.dart';
import '../intro/ui/intro_widget.dart';
import '../techstack/ui/techstack_widget.dart';
import '../videos/ui/videos_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  bool loading = false;

  Future<void> load() async {
    setState(() {
      loading = true;
    });

    await Future.wait([
      rootBundle.load('assets/animations/sun11.riv'),
      rootBundle.load('assets/images/self.png'),
    ]);
    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      loading = false;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading == true ? Center(child: Lottie.asset('assets/animations/loading.json',
      height: MediaQuery.of(context).size.height * .4,
          width: MediaQuery.of(context).size.height * .4,)) : AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Column(
              key: ValueKey<bool>(loading),
                    children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height *1,
                  width: MediaQuery.of(context).size.width *1,
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient( // Add 'const' for optimization
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white54,
                      Colors.transparent,
                    ],
                    stops: [0.6, 0.8, 1.0],
                  ).createShader(bounds),
                  blendMode: BlendMode.dstIn,
                  child: ScreenTypeLayout.builder(
                    desktop: (context){
                      return const rive.RiveAnimation.asset(
                        AppAnimations.sun,
                        fit: BoxFit.cover,
                      );
                    },
                    tablet: (context){
                      return Container(
                        color: Colors.black,
                        child: Opacity(
                          opacity: 0,
                          child: const rive.RiveAnimation.asset(
                            AppAnimations.sun,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    mobile: (context){
                      return Container(
                        color: Colors.black,
                        child: Opacity(
                          opacity: 0,
                          child: const rive.RiveAnimation.asset(
                            AppAnimations.sun,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },

                  )
                ),

              ),
                      const IntroWidget(),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        HighlightsWidget(),
                        TechStackWidget(),
                        ReposWidget(),
                        ContactUsWidget()
                      ],
                    ),
                  ),

                ],
              ),
            ),
            ),
            // NavBarWidget(),
                    ],
                  ),
          ),
    );
  }
}
