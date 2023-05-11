import 'package:annunci_lavoro_flutter/widgets/animation/slide_transiction.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomeCarousel extends StatefulWidget {
  ///
  /// carosello di benvenuto che viene visualizzato solo al primo avvio dell'app.
  ///
  WelcomeCarousel({super.key});

  @override
  State<WelcomeCarousel> createState() => _WelcomeCarouselState();
}

class _WelcomeCarouselState extends State<WelcomeCarousel> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return IntroductionScreen(
      showSkipButton: true,
      bodyPadding: EdgeInsets.zero,
      isTopSafeArea: true,
      globalBackgroundColor: Colors.blue.shade400,
      dotsDecorator: DotsDecorator(
        color: Colors.white30,
        activeColor: Colors.white,
      ),
      key: _introKey,
      pages: [
        _firstPage(screenWidth),
        _secondPage(screenWidth),
      ],
      showNextButton: false,
      back: const Icon(Icons.arrow_back),
      skip: Text(
        'Salta intro',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Color(0x061D5C).withOpacity(1),
              fontWeight: FontWeight.bold,
            ),
      ),
      done: Text(
        "Inizia",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Color(0x061D5C).withOpacity(1),
              fontWeight: FontWeight.bold,
            ),
      ),
      onDone: () => Navigator.pushNamed(context, 'Home_page'),
      onSkip: () => Navigator.pushNamed(context, 'Home_page'),
    );
  }

  PageViewModel _firstPage(double screenWidth) => PageViewModel(
        title: '',
        image: Image(
          width: screenWidth - 50,
          image: AssetImage('assets/images/introduction_image.png'),
        ),
        bodyWidget: SlideTransictionWidget(
            child: EasyRichText(
          'Bacheca di annunci di \n lavoro per assunzioni e \n progetti freelance \n\n completamente gratuito',
          scrollPhysics: NeverScrollableScrollPhysics(),
          defaultStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          patternList: [
            EasyRichTextPattern(
              targetString: 'assunzioni',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            EasyRichTextPattern(
              targetString: 'progetti freelance',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            EasyRichTextPattern(
              targetString: 'completamente gratuito',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ],
        )),
        footer: _footer(),
        decoration: PageDecoration(
          imageFlex: 2,
          bodyFlex: 3,
          footerFlex: 0,
          imageAlignment: Alignment.center,
        ),
      );

  PageViewModel _secondPage(double screenWidth) => PageViewModel(
        title: '',
        image: Image(
          width: screenWidth - 50,
          image: AssetImage('assets/images/introduction_image_2.png'),
        ),
        bodyWidget: SlideTransictionWidget(
          child: EasyRichText(
            'Mettiamo in contatto\nle aziende italiane\n\ncon gli sviluppatori Flutter',
            defaultStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
            patternList: [
              EasyRichTextPattern(
                targetString: 'aziende',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              EasyRichTextPattern(
                targetString: 'sviluppatori Flutter',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
        ),
        footer: _footer(),
        decoration: PageDecoration(
          footerFlex: 0,
          imageAlignment: Alignment.center,
        ),
      );

  Widget _footer() => Column(
        children: [
          Text(
            'Powered by',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(height: 10),
          Image(
            width: 120,
            image: AssetImage('assets/images/fudeo_logo.png'),
          ),
        ],
      );
}
