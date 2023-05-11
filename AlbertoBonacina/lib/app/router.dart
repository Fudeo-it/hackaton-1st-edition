import 'package:go_router/go_router.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/annuncio.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/progetto.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/home/home_page.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/about_page.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/home/screen/annunci/single_annuncio_page.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/home/screen/progetti/single_progetto_page.dart';

GoRouter buildRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/annuncio/single',
        builder: (context, state) => SingleAnnuncioPage(
          annuncio: state.extra! as Annuncio,
        ),
      ),
      GoRoute(
        path: '/progetto/single',
        builder: (context, state) => SingleProgettoPage(
          progetto: state.extra! as Progetto,
        ),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => const AboutPage(),
      ),
    ],
  );
}
