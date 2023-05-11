import 'package:annunci_lavoro_flutter/cubits/dark_mode_cubit.dart';
import 'package:annunci_lavoro_flutter/cubits/first_start_cubit.dart';
import 'package:annunci_lavoro_flutter/widgets/drawer.dart';
import 'package:annunci_lavoro_flutter/widgets/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  ///
  /// Pagina principale dell'app che contiene la [TabView] con le pagine degli annunci.
  ///

  static String routeName = 'Home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, bool>(
      builder: (context, themeState) {
        return Scaffold(
          drawer: const MyDrawer(),
          appBar: _appBar(themeState),
          body: OfflineBuilder(
            connectivityBuilder: (context, connectivity, child) =>
                connectivity == ConnectivityResult.none
                    ? _offlineBody(context)
                    : child,
            child: _showCaseWidget(),
          ),
        );
      },
    );
  }

  /// [Widget] che fa partire il tutorial iniziale solo al primo avvio dell'app,ed alla fine del tutorial
  /// seganala a [FirstStartCubit] che il tutorial è stato completato,per far si che al prossimo avvio
  /// non venga mostarto nuovamente.
  Widget _showCaseWidget() => ShowCaseWidget(
        onFinish: () {
          BlocProvider.of<FirstStartCubit>(context).notifyFirstStart();
          setState(() {});
        },
        builder: Builder(
          builder: (context) => _connectedBody(),
        ),
      );

  ///[Widget] che riotrna la [TabView] quando lo stato di connessione è connesso.
  Widget _connectedBody() => TabView(tabController: _tabController);

  /// [Widget] che mostra lo stato di connessione offline.
  Widget _offlineBody(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off_rounded,
              size: 100,
              color: Colors.black38,
            ),
            Text(
              'Sei offline',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
      );

  PreferredSizeWidget _appBar(bool darkMode) => AppBar(
        backgroundColor: !darkMode
            ? Colors.transparent
            : Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu, size: 30),
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 52),
          child: Container(
            decoration: BoxDecoration(
              gradient: !darkMode
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                        Theme.of(context).primaryColorDark,
                        Theme.of(context).primaryColor,
                      ],
                    )
                  : null,
            ),
            child: TabBar(
              unselectedLabelColor: Colors.white,
              labelPadding: const EdgeInsets.all(4),
              labelColor: Colors.black87,
              indicatorPadding:
                  const EdgeInsets.only(bottom: 3, left: 4, right: 4),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Theme.of(context).primaryColorLight.withOpacity(0.9),
              ),
              labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              controller: _tabController,
              tabs: const [
                Text('Assunzioni'),
                Text('Freelance'),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => BlocProvider.of<DarkModeCubit>(context).toggle(),
            icon: Icon(
              darkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
                width: 40,
                height: 40,
                color: !darkMode ? Colors.black38 : null,
                alignment: Alignment.topLeft,
                colorBlendMode: !darkMode ? BlendMode.darken : null,
                image:
                    const AssetImage('assets/images/flutter_logo_classic.png')),
            Text(
              'FUDEO JOBS',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: !darkMode
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Theme.of(context).primaryColorDark,
                      Theme.of(context).primaryColor,
                    ],
                  )
                : null,
          ),
        ),
      );
}
