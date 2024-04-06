import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _PlashPageState();
}

class _PlashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _scaleAnimation =
        Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159, // 2 pi é uma rotação completa
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();

    Future.delayed(const Duration(seconds: 4), (){
        Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ofSize = MediaQuery.sizeOf(context);
    return Container(
      constraints: BoxConstraints(minWidth: ofSize.width),
      decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.4,
              image: AssetImage("assets/images/backgroud.jpg"),
              fit: BoxFit.cover)),
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: Image.asset(
                      "assets/images/boll.png",
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                Opacity(
                  opacity: _opacityAnimation.value,
                  child: Image.asset(
                    "assets/images/logo.webp",
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
