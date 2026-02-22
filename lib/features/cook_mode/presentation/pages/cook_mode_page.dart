import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchen_lens/core/mock/mock_data.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:kitchen_lens/core/theme/app_dimensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CookModePage extends StatefulWidget {
  const CookModePage({super.key});

  @override
  State<CookModePage> createState() => _CookModePageState();
}

class _CookModePageState extends State<CookModePage> {
  int _currentStep = 0;
  int _timerSeconds = 0;
  bool _timerRunning = false;
  Timer? _timer;

  final steps = MockData.cookModeSteps;

  Map<String, dynamic> get _step => steps[_currentStep];
  int get _totalSteps => steps.length;
  double get _progress => (_currentStep + 1) / _totalSteps;

  void _startTimer(int minutes) {
    _timerSeconds = minutes * 60;
    _timerRunning = true;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_timerSeconds <= 0) {
        t.cancel();
        setState(() => _timerRunning = false);
      } else {
        setState(() => _timerSeconds--);
      }
    });
    setState(() {});
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() => _timerRunning = false);
  }

  String get _formattedTimer {
    final m = (_timerSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (_timerSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _goNext() {
    if (_currentStep < _totalSteps - 1) {
      _stopTimer();
      setState(() => _currentStep++);
    }
  }

  void _goPrevious() {
    if (_currentStep > 0) {
      _stopTimer();
      setState(() => _currentStep--);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundAlt,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(theme),
            _buildProgressBar(),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.05, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: _buildStepContent(theme),
              ),
            ),
            _buildFooter(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.screenPadding,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(LucideIcons.chevronLeft),
            onPressed: _currentStep > 0 ? _goPrevious : null,
          ),
          Text(
            'STEP ${_currentStep + 1} OF $_totalSteps',
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () {
              _stopTimer();
              context.pop();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.surfaceBorder,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Exit',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.screenPadding,
      ),
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: AppColors.surfaceBorder,
          borderRadius: BorderRadius.circular(2),
        ),
        child: FractionallySizedBox(
          widthFactor: _progress,
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent(ThemeData theme) {
    final step = _step;
    final timerMinutes = step['timerMinutes'] as int;

    return SingleChildScrollView(
      key: ValueKey(_currentStep),
      padding: const EdgeInsets.all(AppDimensions.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Image
          Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: step['imageUrl'],
                    fit: BoxFit.cover,
                    placeholder: (_, _) =>
                        Container(color: AppColors.surfaceVariant),
                  ),
                  // "COOKING" badge
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7F9F0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'COOKING',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A3F2A),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn().scale(begin: const Offset(0.98, 0.98)),

          const SizedBox(height: 24),

          // Step Title
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                fontFamily: 'Manrope',
              ),
              children: [
                TextSpan(
                  text: '${step['step']}. ',
                  style: const TextStyle(color: Color(0xFF1A3F2A)),
                ),
                TextSpan(text: step['title']),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.05),

          const SizedBox(height: 8),

          // Description
          Text(
            step['description'],
            style: TextStyle(
              fontSize: 18,
              height: 1.6,
              color: AppColors.textSecondary,
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.05),

          const SizedBox(height: 24),

          // Timer Card (only if step has a timer)
          if (timerMinutes > 0)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(12),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7F9F0),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      LucideIcons.timer,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SUGGESTED TIMER',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textSecondary,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          _timerRunning
                              ? _formattedTimer
                              : '${timerMinutes.toString().padLeft(2, '0')}:00',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: _timerRunning
                                ? AppColors.primary
                                : (AppColors.textPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_timerRunning) {
                        _stopTimer();
                      } else {
                        _startTimer(timerMinutes);
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: _timerRunning
                            ? Colors.red.shade400
                            : AppColors.primary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        _timerRunning ? 'Stop' : 'Start',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.05),

          if (timerMinutes > 0) const SizedBox(height: 16),

          // Tip Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(12),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    LucideIcons.lightbulb,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      step['tip'],
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.05),
        ],
      ),
    );
  }

  Widget _buildFooter(ThemeData theme) {
    final isFirst = _currentStep == 0;
    final isLast = _currentStep == _totalSteps - 1;

    return Container(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.screenPadding,
        12,
        AppDimensions.screenPadding,
        AppDimensions.screenPadding,
      ),
      child: Row(
        children: [
          // Previous Button
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: isFirst ? null : _goPrevious,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.surfaceBorder),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Previous',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: isFirst
                        ? Colors.grey.shade400
                        : (AppColors.textPrimary),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Mic button
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Voice commands coming soon!'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.surfaceBorder),
              ),
              child: Icon(LucideIcons.mic, color: AppColors.primary, size: 24),
            ),
          ),
          const SizedBox(width: 12),

          // Next / Finish Button
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () {
                if (isLast) {
                  _stopTimer();
                  context.go('/home');
                } else {
                  _goNext();
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLast ? 'Finish' : 'Next',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    if (!isLast) ...[
                      const SizedBox(width: 4),
                      const Icon(
                        LucideIcons.chevronRight,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
