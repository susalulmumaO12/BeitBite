import 'package:beit_bite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

class introscreen extends ConsumerWidget {
  const introscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationService = ref.watch(navigationProvider);

    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              title: 'Taste the love',
              body:
                  'Every bite will remind you of beautiful memories, and a loved one\'s cooking',
              image: _buildFullscreenImage('slide1')),
          PageViewModel(
              title: 'Just like at home!',
              body: 'Every meal is homemade.',
              image: _buildFullscreenImage('slide2'))
        ],
        onDone: () {
          navigationService.navigateTo('/signuppage');
        },
        onSkip: () {
          navigationService.navigateTo('/signuppage');
        },
        scrollPhysics: const ClampingScrollPhysics(),
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _buildFullscreenImage(String slide) {
    return Image.asset(
      'assets/images/$slide.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
