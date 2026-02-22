import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  int _currentStep = 0; // 0: Uploading, 1: Analyzing, 2: Recipes
  double _uploadProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _simulatePipeline();
  }

  void _simulatePipeline() async {
    // 1. Uploading
    for (int i = 0; i <= 100; i += 5) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (!mounted) return;
      setState(() => _uploadProgress = i / 100);
    }

    // 2. Analyzing
    setState(() => _currentStep = 1);
    await Future.delayed(const Duration(seconds: 4));

    if (!mounted) return;

    // 3. Complete -> Navigate to results
    setState(() => _currentStep = 2);
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) context.pushReplacement('/ingredients');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildStepIndicator(),
              const Spacer(),
              _buildCenterAnimation(),
              const SizedBox(height: AppDimensions.xl),
              _buildProgressText(),
              const SizedBox(height: AppDimensions.md),
              _buildProgressBar(),
              const SizedBox(height: AppDimensions.xxs),
              Text(
                _currentStep == 0
                    ? 'Encrypting & chunking video...'
                    : 'Detecting fresh produce and dairy',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStepNode('Uploading', 0),
        _buildStepDivider(0),
        _buildStepNode('Analyzing', 1),
        _buildStepDivider(1),
        _buildStepNode('Recipes', 2),
      ],
    );
  }

  Widget _buildStepNode(String label, int stepIndex) {
    final bool isCompleted = _currentStep > stepIndex;
    final bool isActive = _currentStep == stepIndex;

    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted || isActive
                ? AppColors.primary
                : Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, size: 20, color: Colors.white)
                : isActive
                ? Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      )
                      .animate(onPlay: (controller) => controller.repeat())
                      .scale(
                        begin: const Offset(0.8, 0.8),
                        end: const Offset(1.2, 1.2),
                        duration: 800.ms,
                        curve: Curves.easeInOut,
                      )
                : Text(
                    '${stepIndex + 1}',
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
          ),
        ),
        const SizedBox(height: AppDimensions.xs),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isActive || isCompleted
                ? FontWeight.bold
                : FontWeight.normal,
            color: isActive || isCompleted
                ? Theme.of(context).colorScheme.onSurface
                : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildStepDivider(int stepIndex) {
    final bool isCompleted = _currentStep > stepIndex;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 2,
        color: isCompleted
            ? AppColors.primary
            : Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
    );
  }

  Widget _buildCenterAnimation() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withAlpha(13),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat())
              .scale(
                begin: const Offset(0.8, 0.8),
                end: const Offset(1.2, 1.2),
                duration: 2.seconds,
              )
              .fade(begin: 1.0, end: 0.0, duration: 2.seconds),
          Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withAlpha(38),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(
                begin: const Offset(0.9, 0.9),
                end: const Offset(1.1, 1.1),
                duration: 1.5.seconds,
              ),
          const Icon(Icons.lens_blur, size: 80, color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildProgressText() {
    return Text(
      _currentStep == 0
          ? '${(_uploadProgress * 100).toInt()}%'
          : 'Analyzing your ingredients...',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildProgressBar() {
    return Container(
      height: 12,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width:
                    constraints.maxWidth *
                    (_currentStep > 0 ? 1.0 : _uploadProgress),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
