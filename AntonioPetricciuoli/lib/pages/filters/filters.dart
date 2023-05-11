import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:offertelavoroflutter/blocs/blocs.dart';
import 'package:offertelavoroflutter/cubits/cubits.dart';
import 'package:offertelavoroflutter/models/models.dart';
import 'package:offertelavoroflutter/styles.dart';
import 'package:offertelavoroflutter/widgets/widgets.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  final TextEditingController queryController = TextEditingController();

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.kScaffold,
        elevation: 1,
        title: Text("Filtra annunci di lavoro", style: Styles.kTitle),
        centerTitle: true,
      ),
      body: BlocBuilder<FiltersCubit, FiltersState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: Styles.kPaddingAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Offertelavoroflutter.it ti permette di filtrare gli annunci di lavoro in base alle tue preferenze.",
                    style: Styles.kBody,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "I filtri vengono applicati anche sugli elementi salvati.",
                    style: Styles.kBody,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Parola chiave",
                    style: Styles.kSubtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Styles.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: queryController,
                    decoration: Styles.kInputDecoration.copyWith(
                      hintText: "Es. Flutter",
                    ),
                    onChanged: (value) {
                      context.read<FiltersCubit>().query(value);
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Seniority",
                    style: Styles.kSubtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Styles.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<Seniority>(
                    borderRadius: Styles.kBorderRadius,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: Styles.kBorderRadius,
                        borderSide: BorderSide(
                          color: Styles.kSecondaryColor,
                          width: 0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: Styles.kBorderRadius,
                        borderSide: BorderSide(
                          color: Styles.kSecondaryColor,
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: Styles.kBorderRadius,
                        borderSide: BorderSide(
                          color: Styles.kSecondaryColor,
                          width: 0,
                        ),
                      ),
                    ),
                    value: state.seniority,
                    items: [
                      DropdownMenuItem(
                        value: Seniority.all,
                        child: Text(
                          "Tutti",
                          style: Styles.kBody,
                        ),
                      ),
                      DropdownMenuItem(
                        value: Seniority.junior,
                        child: Text(
                          "Junior",
                          style: Styles.kBody,
                        ),
                      ),
                      DropdownMenuItem(
                        value: Seniority.mid,
                        child: Text(
                          "Mid",
                          style: Styles.kBody,
                        ),
                      ),
                      DropdownMenuItem(
                        value: Seniority.senior,
                        child: Text(
                          "Senior",
                          style: Styles.kBody,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        context.read<FiltersCubit>().seniority(value);
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Team",
                    style: Styles.kSubtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Styles.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<Team>(
                    borderRadius: Styles.kBorderRadius,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: Styles.kBorderRadius,
                        borderSide: BorderSide(
                          color: Styles.kSecondaryColor,
                          width: 0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: Styles.kBorderRadius,
                        borderSide: BorderSide(
                          color: Styles.kSecondaryColor,
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: Styles.kBorderRadius,
                        borderSide: BorderSide(
                          color: Styles.kSecondaryColor,
                          width: 0,
                        ),
                      ),
                    ),
                    value: state.team,
                    items: [
                      DropdownMenuItem(
                        value: Team.all,
                        child: Text(
                          "Tutti",
                          style: Styles.kBody,
                        ),
                      ),
                      DropdownMenuItem(
                        value: Team.inOffice,
                        child: Text(
                          "In sede",
                          style: Styles.kBody,
                        ),
                      ),
                      DropdownMenuItem(
                        value: Team.ibrid,
                        child: Text(
                          "Ibrido",
                          style: Styles.kBody,
                        ),
                      ),
                      DropdownMenuItem(
                        value: Team.fullRemote,
                        child: Text(
                          "Full-remote",
                          style: Styles.kBody,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        context.read<FiltersCubit>().team(value);
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Contratto",
                    style: Styles.kSubtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Styles.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<Contract>(
                    borderRadius: Styles.kBorderRadius,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: Styles.kBorderRadius,
                        borderSide: BorderSide(
                          color: Styles.kSecondaryColor,
                          width: 0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: Styles.kBorderRadius,
                        borderSide: BorderSide(
                          color: Styles.kSecondaryColor,
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: Styles.kBorderRadius,
                        borderSide: BorderSide(
                          color: Styles.kSecondaryColor,
                          width: 0,
                        ),
                      ),
                    ),
                    value: state.contract,
                    items: [
                      DropdownMenuItem(
                        value: Contract.all,
                        child: Text(
                          "Tutti",
                          style: Styles.kBody,
                        ),
                      ),
                      DropdownMenuItem(
                        value: Contract.fullTime,
                        child: Text(
                          "Full-time",
                          style: Styles.kBody,
                        ),
                      ),
                      DropdownMenuItem(
                        value: Contract.partTime,
                        child: Text(
                          "Part-time",
                          style: Styles.kBody,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        context.read<FiltersCubit>().contract(value);
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "RAL",
                    style: Styles.kSubtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Styles.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text("${state.ral.first.toInt()} €", style: Styles.kBody),
                      const Spacer(),
                      Text("${state.ral.last.toInt()} €", style: Styles.kBody),
                    ],
                  ),
                  RangeSlider(
                    min: 0,
                    max: 100000,
                    values: RangeValues(state.ral.first, state.ral.last),
                    onChanged: (value) {
                      context.read<FiltersCubit>().ral(
                        [value.start, value.end],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    title: "Applica",
                    onTap: () {
                      CustomSnackbars.showInfo(context,
                          message: "Filtri applicati");
                      context.go('/home');
                      context.read<JobsBloc>().add(
                            JobsGet(
                              filters: Filters(
                                query: state.query,
                                seniority: state.seniority,
                                team: state.team,
                                contract: state.contract,
                                ral: state.ral,
                              ),
                            ),
                          );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    title: "Cancella filtri",
                    hasBorder: true,
                    textColor: Styles.kErrorColor,
                    borderColor: Styles.kErrorColor,
                    backgroundColor: Styles.kScaffold,
                    onTap: () {
                      queryController.clear();
                      context.read<FiltersCubit>().reset();
                      context.read<JobsBloc>().add(const JobsGet());
                      context.go('/home');
                      CustomSnackbars.showInfo(context,
                          message: "Filtri cancellati");
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
