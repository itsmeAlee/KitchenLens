import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchen_lens/features/onboarding/presentation/widgets/step_one_welcome.dart';
import 'package:kitchen_lens/features/onboarding/presentation/widgets/step_two_permissions.dart';
import 'package:kitchen_lens/features/onboarding/presentation/widgets/step_three_diet.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/auth');
    }
  }

  void _skip() {
    context.go('/auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics:
                const NeverScrollableScrollPhysics(), // Disable swipe to force using buttons
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              StepOneWelcome(onNext: _nextPage, onSkip: _skip),
              StepTwoPermissions(onNext: _nextPage, onSkip: _skip),
              StepThreeDiet(onNext: _nextPage, onSkip: _skip),
            ],
          ),
          // We can put global page indicators here or inside each step. Inside each step gives more control.
        ],
      ),
    );
  }
}
