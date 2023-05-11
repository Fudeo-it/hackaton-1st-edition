import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:offertelavoroflutter/styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        context.go('/home');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0553B1),
              Styles.kPrimaryColor,
              Color(0xFF196CD4),
              Color(0xFF833EF2),
            ],
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 128,
                width: 128,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Styles.kWhite,
                  borderRadius: Styles.kBorderRadius,
                ),
                child: const FlutterLogo(
                  size: 64,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "OFFERTELAVOROFLUTTER.IT",
                style: Styles.kTitle.copyWith(
                  color: Styles.kWhite,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Trova il lavoro dei tuoi sogni",
                style: Styles.kSubtitle.copyWith(
                  color: Styles.kWhite,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
