import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchen_lens/core/theme/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProcessingPage extends StatefulWidget {
  const ProcessingPage({super.key});

  @override
  State<ProcessingPage> createState() => _ProcessingPageState();
}

class _ProcessingPageState extends State<ProcessingPage> with TickerProviderStateMixin {
  int _currentStep = 0;
  double _progress = 0.0;
  Timer? _timer;

  late AnimationController _scanController;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat();

    _startProcessingSimulation();
  }

  void _startProcessingSimulation() {
    const totalDuration = Duration(seconds: 10);
    const tickInterval = Duration(milliseconds: 50);
    final totalTicks = totalDuration.inMilliseconds / tickInterval.inMilliseconds;
    int currentTick = 0;

    _timer = Timer.periodic(tickInterval, (timer) {
      currentTick++;
      final newProgress = currentTick / totalTicks;
      
      if (newProgress >= 1.0) {
        timer.cancel();
        if (mounted) {
          setState(() {
            _progress = 1.0;
            _currentStep = 3; // all complete
          });
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) context.go('/scan_result');
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _progress = newProgress;
            if (_progress < 0.3) {
              _currentStep = 0;
            } else if (_progress < 0.8) {
              _currentStep = 1;
            } else {
              _currentStep = 2;
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final bgDark = const Color(0xFF112116);
    final bgLight = const Color(0xFFF6F8F6);
    final surfaceDark = const Color(0xFF1E2D24);
    
    // Estimate time left
    final timeLeft = (10 - (_progress * 10)).ceil();

    return Scaffold(
      backgroundColor: isDark ? bgDark : bgLight,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                    ),
                    icon: Icon(
                      Icons.close,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/home');
                      }
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 48), // Balance for back button
                      child: Text(
                        'Processing',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.2,
                          color: isDark ? Colors.white : const Color(0xFF0F172A),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content Area
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Hero Animation Placeholder
                    Container(
                      decoration: BoxDecoration(
                        color: isDark ? surfaceDark : Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          if (!isDark)
                            BoxShadow(
                              color: Colors.black.withAlpha(12),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                        ],
                      ),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // Background gradient overlay
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: isDark 
                                        ? [AppColors.primary.withAlpha(25), AppColors.primary.withAlpha(12)]
                                        : [AppColors.primary.withAlpha(12), AppColors.primary.withAlpha(50)],
                                  ),
                                ),
                              ),
                              // Abstract representation of scanning (Image)
                              Opacity(
                                opacity: 0.8,
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    isDark ? Colors.black.withAlpha(150) : AppColors.primary.withAlpha(50),
                                    BlendMode.multiply,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAhxDE8VujjDH7hNOJQcDI5Wowyy9P-8-0RbJJVaxwxt_DlJMZc3DLhUMXKJkExczSjH5IoVKqLsEPQT8FI2p-slT38DglJR8KlMMF19TAu9ojLjRYjpRYkYF3EG4m2fhUbZmeohIm7mCdyqk2zr3c3si5PQwPIExrqCfeNSaM7W1xZiVsWt6Fiwfotzp1XKzAqIq18Mcv-AZgSGON7AGjErE14bzVFfUr7RHrrjv11SMoEiuooYkwOWeo0PG-jk33tCcZ0RGvdAucw',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Scanning Line Animation Effect
                              AnimatedBuilder(
                                animation: _scanController,
                                builder: (context, child) {
                                  return Positioned(
                                    top: (_scanController.value * 100) * 3, // approximate to height, will just use fractional translation
                                    left: 0,
                                    right: 0,
                                    child: FractionalTranslation(
                                      translation: Offset(0, _scanController.value * 4/3 * 100), // simplistic approach, absolute better
                                      child: child,
                                    ),
                                  );
                                },
                                child: const SizedBox.shrink(),
                              ),
                              // Correct Scan line
                              AnimatedBuilder(
                                animation: _scanController,
                                builder: (context, child) {
                                  return Positioned(
                                    top: (_scanController.value * 120) - 20 + '%'.length, // Hack for responsive
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Align(
                                      alignment: Alignment(0, -1.0 + (_scanController.value * 2.0)),
                                      child: Container(
                                        height: 3,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.primary.withAlpha(200),
                                              blurRadius: 20,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              // Scanning Badge
                              Positioned(
                                bottom: 16,
                                right: 16,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(999),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: isDark ? Colors.black.withAlpha(150) : Colors.white.withAlpha(230),
                                        borderRadius: BorderRadius.circular(999),
                                        border: Border.all(color: AppColors.primary.withAlpha(50)),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.sync,
                                            size: 16,
                                            color: AppColors.primary,
                                          ).animate(onPlay: (controller) => controller.repeat()).rotate(duration: 2.seconds),
                                          const SizedBox(width: 4),
                                          const Text(
                                            'Scanning',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animate().fadeIn().slideY(begin: 0.1),

                    const SizedBox(height: 24),

                    // Progress Percentage & Bar
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Progress',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                                  ),
                                ),
                                Text(
                                  '${(_progress * 100).toInt()}%',
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -1,
                                    color: AppColors.primary,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withAlpha(25),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  _progress >= 1.0 ? 'Done' : 'Est. ${timeLeft}s left',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Progress Bar Container
                        Container(
                          height: 16,
                          width: double.infinity,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Stack(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 100),
                                    width: constraints.maxWidth * _progress,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                  ),
                                ],
                              );
                            }
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1),

                    const SizedBox(height: 24),

                    // Vertical Stepper
                    Column(
                      children: [
                        _buildStep(
                          isDark: isDark,
                          isActive: _currentStep == 0,
                          isCompleted: _currentStep > 0,
                          stepNumber: 1,
                          title: 'Uploading',
                          subtitle: _currentStep > 0 ? 'Image successfully uploaded' : 'Uploading frame...',
                          activeSubtitle: 'Sending to cloud...',
                          icon: Icons.cloud_upload_outlined,
                        ),
                        const SizedBox(height: 16),
                        _buildStep(
                          isDark: isDark,
                          isActive: _currentStep == 1,
                          isCompleted: _currentStep > 1,
                          stepNumber: 2,
                          title: _currentStep > 1 ? 'Ingredients Analyzed' : 'Analyzing ingredients...',
                          subtitle: _currentStep > 1 ? 'Found multiple ingredients' : 'Waiting for image',
                          activeSubtitle: 'Identifying vegetables & proteins',
                          icon: Icons.auto_awesome_outlined,
                        ),
                        const SizedBox(height: 16),
                        _buildStep(
                          isDark: isDark,
                          isActive: _currentStep >= 2,
                          isCompleted: _currentStep > 2,
                          stepNumber: 3,
                          title: 'Generating Recipes',
                          subtitle: _currentStep >= 2 ? 'Crafting perfect dishes...' : 'Waiting for analysis',
                          activeSubtitle: 'Matching with database',
                          icon: Icons.restaurant_menu_outlined,
                        ),
                      ],
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
                  ],
                ),
              ),
            ),

            // Bottom Action
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    isDark ? bgDark : bgLight,
                    isDark ? bgDark.withAlpha(240) : bgLight.withAlpha(240),
                    isDark ? bgDark.withAlpha(0) : bgLight.withAlpha(0),
                  ],
                ),
              ),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/home');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
                      foregroundColor: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    icon: const Icon(Icons.visibility_off_outlined, size: 18),
                    label: const Text(
                      'Hide',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "We'll notify you when your recipes are ready.",
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({
    required bool isDark,
    required bool isActive,
    required bool isCompleted,
    required int stepNumber,
    required String title,
    required String subtitle,
    required String activeSubtitle,
    required IconData icon,
  }) {
    if (isCompleted) {
      // Completed Step
      return ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2D24).withAlpha(180) : Colors.white.withAlpha(180),
              borderRadius: BorderRadius.circular(24),
              border: Border(
                left: const BorderSide(color: AppColors.primary, width: 4),
                top: BorderSide(color: Colors.white.withAlpha(isDark ? 12 : 128)),
                right: BorderSide(color: Colors.white.withAlpha(isDark ? 12 : 128)),
                bottom: BorderSide(color: Colors.white.withAlpha(isDark ? 12 : 128)),
              ),
              boxShadow: [
                if (!isDark)
                  BoxShadow(
                    color: Colors.black.withAlpha(5),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withAlpha(75),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.check, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : const Color(0xFF0F172A),
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (isActive) {
      // Active Step
      return ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Stack(
            children: [
              // Pulse background
              Positioned.fill(
                child: Container(
                  color: isDark ? AppColors.primary.withAlpha(25) : AppColors.primary.withAlpha(12),
                ).animate(onPlay: (controller) => controller.repeat(reverse: true)).fade(begin: 0.5, end: 1.0, duration: 1.5.seconds),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border(
                    left: const BorderSide(color: AppColors.primary, width: 4),
                    top: BorderSide(color: Colors.white.withAlpha(isDark ? 12 : 128)),
                    right: BorderSide(color: Colors.white.withAlpha(isDark ? 12 : 128)),
                    bottom: BorderSide(color: Colors.white.withAlpha(isDark ? 12 : 128)),
                  ),
                  boxShadow: [
                    if (!isDark)
                      BoxShadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E293B) : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withAlpha(75),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : const Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            activeSubtitle,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      // Pending Step
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B).withAlpha(75) : const Color(0xFFF8FAFC).withAlpha(128),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? const Color(0xFF475569) : const Color(0xFFCBD5E1),
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                stepNumber.toString(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isDark ? const Color(0xFF475569) : const Color(0xFFCBD5E1),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
