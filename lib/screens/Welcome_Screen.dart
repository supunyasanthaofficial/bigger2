import 'package:flutter/material.dart';

class FadeInWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const FadeInWidget({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  _FadeInWidgetState createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static const String logoUrl =
      'https://drive.google.com/uc?export=view&id=1PN2VDmdS_1NPzFYwGpBGfyiCsIqwWIeV';

  @override
  void initState() {
    super.initState();
    // Navigate to /login after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        debugPrint('Navigating to /login from WelcomeScreen');
        try {
          Navigator.pushReplacementNamed(context, '/login');
        } catch (e) {
          debugPrint('Navigation error: $e');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Stack(
        children: [
          // Logo with Image.network from Google Drive
          FadeInWidget(
            delay: const Duration(milliseconds: 200),
            child: Center(
              child: Image.network(
                logoUrl,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  debugPrint('Logo image load failed: $error');
                  return const Icon(
                    Icons.broken_image,
                    size: 150,
                    color: Colors.white,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
