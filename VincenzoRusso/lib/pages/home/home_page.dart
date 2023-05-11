import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';
import 'package:offertelavoroflutter_app/widgets/clickable_card.dart';
import 'package:offertelavoroflutter_app/widgets/favourite_list.dart';
import 'package:offertelavoroflutter_app/widgets/job_flutter_button.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: const [
            Expanded(
              child: _ContentHome(),
            ),
            _BottomButtom(),
          ],
        ),
      );
}

class _ContentHome extends StatelessWidget {
  const _ContentHome();

  @override
  Widget build(BuildContext context) => ListView(
        key: const Key("first list view"),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryLight,
            ),
            child: SafeArea(
              bottom: false,
              left: false,
              right: false,
              top: true,
              child: Center(
                child: Image.asset(
                  "assets/images/offertelavoroflutter.gif",
                  height: 300,
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Benvenuto!!!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(16.0),
                  ),
                  child: Image.asset(
                    "assets/images/empty_chair.jpg",
                    fit: BoxFit.cover,
                    height: 220,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Offertelavoroflutter.it è la prima 📋 bacheca di annunci dove puoi trovare 🧑🏻‍💻 lavoro per assunzioni e progetti freelance per il 🌍 mondo Flutter. Cosa stai aspettando? 🔜 Il tuo prossimo lavoro ti ASPETTA 🕺🏻",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Cosa stai cercando?",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ClickableCard(
                    key: const Key("go to jobs"),
                    text: "💼\nLavoro per assunzioni",
                    onPressed: () =>
                        context.router.push(JobsRoute(initialPage: 0)),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ClickableCard(
                    key: const Key("go to freelance"),
                    text: "🧑🏻‍💻\nProgetti freelance",
                    onPressed: () =>
                        context.router.push(JobsRoute(initialPage: 1)),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<FavouriteJobBloc, FavouriteJobState>(
            builder: (context, state) {
              if (state is LoadedFavouriteJobState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 24.0,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          "Le tue offerte:",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      FavouriteList(
                        shrinkWrap: true,
                        favourites: state.favouriteJob,
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
          const SizedBox(height: 40.0),
        ],
      );
}

class _BottomButtom extends StatelessWidget {
  const _BottomButtom();

  @override
  Widget build(BuildContext context) => SafeArea(
        bottom: true,
        top: false,
        left: false,
        right: false,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 48.0,
            vertical: 12.0,
          ),
          height: 80.0,
          width: double.infinity,
          child: JobFlutterButton(
            child: Text(
              "Inizia subito",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.white),
            ),
            onPressed: () => context.router.push(JobsRoute(initialPage: 0)),
          ),
        ),
      );
}
