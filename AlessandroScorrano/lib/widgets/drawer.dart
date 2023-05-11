import 'package:annunci_lavoro_flutter/cubits/dark_mode_cubit.dart';
import 'package:annunci_lavoro_flutter/widgets/dialog_and_bottomsheet/link_error_dialog.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        children: [
          _header(context),
          const SizedBox(height: 16),
          _menuButton(context,
              icon: Icon(
                FontAwesomeIcons.solidBookmark,
                color: Theme.of(context).primaryColor,
              ),
              text: 'Annunci salvati',
              onTap: () => Navigator.pushNamed(context, 'favourite')),
          _divider(),
          _menuButton(context,
              icon: Icon(FontAwesomeIcons.envelope),
              text: 'Newsletter',
              onTap: () => _goToNewsletter(context)),
          _divider(),
          _menuButton(context,
              icon: Icon(FontAwesomeIcons.school),
              text: 'I nostri corsi',
              onTap: () => _goToFudeoCourse(context)),
          Spacer(),
          _logo(context),
        ],
      ),
    );
  }

  Widget _divider() => const Divider(thickness: 1, indent: 8, endIndent: 8);

  Widget _header(BuildContext context) => Container(
        margin: const EdgeInsets.only(right: 4),
        height: 180,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(12)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              const Color(0x061D5C).withOpacity(1),
              const Color(0x027DFD).withOpacity(1),
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Image(
                fit: BoxFit.cover,
                width: 80,
                height: 110,
                image: AssetImage('assets/images/flutter_logo_classic.png'),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 6.0, bottom: 6),
                child: EasyRichText(
                  'Bacheca di annunci di \n lavoro per assunzioni e \n progetti freelance \n\n completamente gratuito',
                  defaultStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: 'assunzioni',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    EasyRichTextPattern(
                      targetString: 'progetti freelance',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    EasyRichTextPattern(
                      targetString: 'completamente gratuito',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget _menuButton(BuildContext context,
          {required Icon icon,
          required String text,
          required Function() onTap}) =>
      ListTile(
        selectedTileColor: Theme.of(context).primaryColor,
        style: ListTileStyle.drawer,
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        leading: icon,
        title: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      );

  Future<void> _goToFudeoCourse(BuildContext context) async {
    final Uri _url = Uri.parse("https://www.fudeo.it/#InternalCourses");
    if (!await launchUrl(_url)) {
      showDialog(
          context: context, builder: (context) => const LinkErrorDialog());
    }
  }

  Future<void> _goToNewsletter(BuildContext context) async {
    final Uri _url = Uri.parse(
        "https://offertelavoroflutter.it/ricevi-offerte-lavoro-flutter");
    if (!await launchUrl(_url)) {
      showDialog(
          context: context, builder: (context) => const LinkErrorDialog());
    }
  }

  Widget _logo(BuildContext context) => BlocBuilder<DarkModeCubit, bool>(
        builder: (context, themeMode) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 26.0),
            child: Image(
                color: themeMode ? Theme.of(context).disabledColor : null,
                height: 40,
                width: 140,
                fit: BoxFit.contain,
                image: AssetImage('assets/images/fudeo_logo.png')),
          );
        },
      );
}
