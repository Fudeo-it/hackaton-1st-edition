import 'dart:ui';

import 'package:annunci_lavoro_flutter/blocs/favourites/bloc/favourites_bloc.dart';
import 'package:annunci_lavoro_flutter/blocs/freelanceAds/bloc/freelance_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/blocs/jobAds/bloc/job_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/models/freelance_positions_model.dart';
import 'package:annunci_lavoro_flutter/models/job_positions_model.dart';
import 'package:annunci_lavoro_flutter/widgets/cards/freelance_ads_card.dart';
import 'package:annunci_lavoro_flutter/widgets/cards/job_ads_card.dart';
import 'package:annunci_lavoro_flutter/widgets/shimmers/shimmed_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

class FavouritePage extends StatefulWidget {
  ///
  /// pagina che contiene gli annunci preferiti di tipo [JobPosition] e [FreeLancePosition].
  ///
  static String routeName = 'favourite';
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  int? freelanceOrJobPosition;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavouritesBloc>(
      create: (context) => FavouritesBloc(
        adsRepository: context.read(),
        jobAdsBloc: context.read(),
        freelanceAdsBloc: context.read(),
      )..getAds(),
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  Widget _appBar() => SliverAppBar(
        pinned: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 40,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Annunci Salvati',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 70),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Column(
                children: [
                  Divider(thickness: 2),
                  _selctionButtons(),
                ],
              ),
            ),
          ),
        ),
      );

  /// [GroupButton] utilizzato per scegliere se visualizzare gli annunci [FreeLancePosition] o [JobPosition] oppure entrambi.
  Widget _selctionButtons() => Container(
        margin: const EdgeInsets.only(bottom: 4),
        child: GroupButton(
          onSelected: (value, index, isSelected) {
            setState(
              () {
                !isSelected
                    ? freelanceOrJobPosition = null
                    : freelanceOrJobPosition = index;
              },
            );
          },
          enableDeselect: true,
          buttons: const ['assunzioni', 'freelance'],
          options: GroupButtonOptions(
            unselectedTextStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor),
            selectedTextStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
            borderRadius: BorderRadius.circular(16),
            selectedBorderColor: Theme.of(context).primaryColor,
            unselectedBorderColor: Theme.of(context).primaryColor,
            selectedColor: Theme.of(context).primaryColorDark,
            unselectedColor: Theme.of(context).scaffoldBackgroundColor,
            buttonWidth: MediaQuery.of(context).size.width / 2 - 10,
          ),
        ),
      );

  Widget _body() => BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, state) {
          if (state is FetchingFavState) {
            return ShimmedList(
              child: JobAdsCard.shimmed(),
            );
          } else if (state is FetchedFavState) {
            return CustomScrollView(
              slivers: [
                _appBar(),
                _jobAdsCount(),
                _jobPositionList(),
                _freelanceAdsCount(),
                _freeLancePositionList(),
              ],
            );
          } else {
            return const Center(child: Text('Errore'));
          }
        },
      );

  Widget _jobPositionList() => SliverVisibility(
        visible: freelanceOrJobPosition == 0 || freelanceOrJobPosition == null
            ? true
            : false,
        sliver: StreamBuilder<List<JobPosition>>(
          stream:
              BlocProvider.of<JobAdsBloc>(context).jobAdsController.favstream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()));
            } else if (snapshot.data!.isEmpty) {
              return _noAdsWidget();
            } else {
              return SliverList.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return JobAdsCard(
                      jobPosition: snapshot.data![index], enabled: true);
                },
              );
            }
          },
        ),
      );

  Widget _freeLancePositionList() => SliverVisibility(
        visible: freelanceOrJobPosition == 1 || freelanceOrJobPosition == null
            ? true
            : false,
        sliver: StreamBuilder(
          stream: BlocProvider.of<FreelanceAdsBloc>(context)
              .freeLanceAdsController
              .favstream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()));
            } else if (snapshot.data!.isEmpty) {
              return _noAdsWidget();
            } else {
              return SliverList.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => FreelanceAdsCard(
                    freeLancePosition: snapshot.data![index], enabled: true),
                //separatorBuilder: (context, index) => _listDivider(),
              );
            }
          },
        ),
      );

  Widget _jobAdsCount() => SliverPadding(
        padding: const EdgeInsets.only(bottom: 20.0, top: 10),
        sliver: SliverToBoxAdapter(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 1,
                        spreadRadius: 0.7,
                        offset: Offset(0, 2),
                      )
                    ]),
                child: Row(
                  children: [
                    const Icon(Icons.list),
                    const SizedBox(
                      width: 10,
                    ),
                    StreamBuilder<List<JobPosition>>(
                      stream: BlocProvider.of<JobAdsBloc>(context)
                          .jobAdsController
                          .favstream,
                      builder: (context, snapshot) => !snapshot.hasData
                          ? const SizedBox()
                          : Text(
                              'Annunci per assunzioni:  ${snapshot.data!.length}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _freelanceAdsCount() => SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        sliver: SliverToBoxAdapter(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 1,
                      spreadRadius: 0.7,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.list),
                    const SizedBox(
                      width: 10,
                    ),
                    StreamBuilder<List<FreeLancePosition>>(
                      stream: BlocProvider.of<FreelanceAdsBloc>(context)
                          .freeLanceAdsController
                          .favstream,
                      builder: (context, snapshot) => !snapshot.hasData
                          ? const SizedBox()
                          : Text(
                              'Annunci per freelancer:  ${snapshot.data!.length}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _noAdsWidget() => SliverToBoxAdapter(
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.list,
                size: 60,
                color: Colors.grey.shade500,
              ),
              const SizedBox(height: 10),
              Text(
                'Nessun Annuncio',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      );
}
