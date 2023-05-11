import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/models/app/filter_tag_model.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/widgets/icon_item.dart';

class SearchSliverBar extends StatefulWidget {
  const SearchSliverBar({Key? key}) : super(key: key);

  @override
  State<SearchSliverBar> createState() => _SearchSliverBarState();
}

class _SearchSliverBarState extends State<SearchSliverBar>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _heightAppBarController;

  late Animation<double> _animationFiltersContainer;
  late AnimationController _heightFiltersContainerController;

  final TextEditingController _serachBarController = TextEditingController();
  final TextEditingController _serachLocController = TextEditingController();

  String? _localityFilterText;

  bool isFocused = false;
  bool isTappedFilterButton = false;

  @override
  void initState() {
    _heightAppBarController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    _animation =
        Tween<double>(begin: 90, end: 350).animate(_heightAppBarController)
          ..addListener(() {
            setState(() {});
          });

    _heightFiltersContainerController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    _animationFiltersContainer =
        Tween<double>(begin: 0, end: 250).animate(_heightAppBarController)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  void _expandSearchBar() {
    if (isTappedFilterButton) {
      _heightAppBarController.forward();
      _heightFiltersContainerController.forward();
    } else {
      _heightAppBarController.reverse();
      _heightFiltersContainerController.reverse();
    }
  }

  void _resetFilters() {
    for (final seniority in seniorityfilters) {
      setState(() {
        seniority.isSelected = false;
      });
    }

    for (final team in teamFilters) {
      setState(() {
        team.isSelected = false;
      });
    }

    for (final agreement in agreementFilters) {
      setState(() {
        agreement.isSelected = false;
      });
    }

    setState(() {
      _localityFilterText = null;
      _serachLocController.text = "";
    });
  }

  @override
  void dispose() {
    _heightAppBarController.dispose();
    _heightFiltersContainerController.dispose();
    _serachBarController.dispose();
    _serachLocController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      toolbarHeight: _animation.value,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isTappedFilterButton ||
                  seniorityfilters
                      .where((seniority) => seniority.isSelected == true)
                      .isNotEmpty ||
                  teamFilters
                      .where((team) => team.isSelected == true)
                      .isNotEmpty ||
                  agreementFilters
                      .where((agreement) => agreement.isSelected == true)
                      .isNotEmpty ||
                  _localityFilterText != null
              ? _searchBarWidget
              : _searchBarText,
          _expandedSearchBar,
        ],
      ),
    );
  }

  Widget get _searchBarText => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TextField(
              controller: _serachBarController,
              onTap: () => setState(() {
                isFocused = !isFocused;
              }),
              onSubmitted: (value) => setState(() {
                isFocused = !isFocused;
              }),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  LucideIcons.search,
                  color: isFocused
                      ? K.primaryColor
                      : K.secondaryColor.withOpacity(0.10),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          _filterSearchButton,
        ],
      );

  Widget get _searchBarWidget => SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                height: 60.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: K.secondaryColor.withOpacity(0.10),
                    width: 2.0,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.search,
                      color: isFocused
                          ? K.primaryColor
                          : K.secondaryColor.withOpacity(0.10),
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ..._signorityFilters,
                          ..._teamFilters,
                          ..._agreementFilters,
                          _localityFilter,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            _filterSearchButton,
          ],
        ),
      );

  List<Widget> get _signorityFilters => List.generate(
        seniorityfilters.length,
        (index) => seniorityfilters[index].isSelected
            ? _FilterTagBarWidget(
                label: seniorityfilters[index].label,
                onTap: () => setState(() {
                  seniorityfilters[index].isSelected =
                      !seniorityfilters[index].isSelected;
                }),
              )
            : const SizedBox(),
      );

  List<Widget> get _teamFilters => List.generate(
        seniorityfilters.length,
        (index) => teamFilters[index].isSelected
            ? _FilterTagBarWidget(
                label: teamFilters[index].label,
                onTap: () => setState(() {
                  teamFilters[index].isSelected =
                      !teamFilters[index].isSelected;
                }),
              )
            : const SizedBox(),
      );

  List<Widget> get _agreementFilters => List.generate(
        agreementFilters.length,
        (index) => agreementFilters[index].isSelected
            ? _FilterTagBarWidget(
                label: agreementFilters[index].label,
                onTap: () => setState(() {
                  agreementFilters[index].isSelected =
                      !agreementFilters[index].isSelected;
                }),
              )
            : const SizedBox(),
      );

  Widget get _localityFilter => _localityFilterText != null
      ? _FilterTagBarWidget(
          label: _localityFilterText!,
          onTap: () => setState(() {
            _localityFilterText = null;
            _serachLocController.text = "";
          }),
        )
      : const SizedBox();

  Widget get _filterSearchButton => IconItem(
        isTapped: isTappedFilterButton,
        icon: LucideIcons.settings2,
        onTap: () {
          setState(() {
            isTappedFilterButton = !isTappedFilterButton;
          });
          _expandSearchBar();
        },
      );

  Widget get _expandedSearchBar => Container(
        margin: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        height: _animationFiltersContainer.value,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: _resetFilters,
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  child: Text(
                    AppLocalizations.of(context)?.action_reset_filters ??
                        "action_reset_filters",
                    style: const TextStyle(
                      color: K.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            ExpandablePanel(
              header: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppLocalizations.of(context)?.label_more_filters ??
                      "label_more_filters",
                  style: const TextStyle(
                    fontSize: 14,
                    color: K.secondaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              collapsed: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleSectionFilterPanel(AppLocalizations.of(context)
                          ?.title_filter_section_experience ??
                      "title_filter_section_experience"),
                  _buildSeniorityFilters,
                  const SizedBox(
                    height: 4.0,
                  ),
                  _titleSectionFilterPanel(
                      AppLocalizations.of(context)?.title_filter_section_team ??
                          "title_filter_section_team"),
                  _buildTeamFilters,
                  const SizedBox(
                    height: 4.0,
                  ),
                ],
              ),
              expanded: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleSectionFilterPanel(AppLocalizations.of(context)
                          ?.title_filter_section_agreement ??
                      "title_filter_section_agreement"),
                  _buildAgreementFilters,
                  const SizedBox(
                    height: 4.0,
                  ),
                  _titleSectionFilterPanel(AppLocalizations.of(context)
                          ?.title_filter_section_locality ??
                      "title_filter_section_locality"),
                  _buildLocalityFilters,
                ],
              ),
            ),
          ],
        ),
      );

  Widget _titleSectionFilterPanel(String title) => Text(
        title,
        style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
      );

  Widget get _buildSeniorityFilters => Row(
        children: [
          for (final seniorityFilter in seniorityfilters)
            _FilterTagWidget(
              filterTag: seniorityFilter,
              onSelected: (value) => setState(() {
                seniorityFilter.isSelected = !seniorityFilter.isSelected;
              }),
            ),
        ],
      );

  Widget get _buildTeamFilters => Row(
        children: [
          for (final teamFiler in teamFilters)
            _FilterTagWidget(
              filterTag: teamFiler,
              onSelected: (value) => setState(() {
                teamFiler.isSelected = !teamFiler.isSelected;
              }),
            ),
        ],
      );

  Widget get _buildAgreementFilters => Row(
        children: [
          for (final agreementFilter in agreementFilters)
            _FilterTagWidget(
              filterTag: agreementFilter,
              onSelected: (value) => setState(() {
                agreementFilter.isSelected = !agreementFilter.isSelected;
              }),
            ),
        ],
      );

  Widget get _buildLocalityFilters => Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: TextField(
          controller: _serachLocController,
          onChanged: (value) => setState(() {
            _localityFilterText = value;
          }),
        ),
      );
}

class _FilterTagWidget extends StatelessWidget {
  final FilterTagModel filterTag;
  final void Function(bool)? onSelected;
  const _FilterTagWidget({Key? key, required this.filterTag, this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          FilterChip(
            checkmarkColor: K.accentColor,
            pressElevation: 0.0,
            backgroundColor: K.secondaryColor.withOpacity(0.18),
            selectedColor: K.primaryColor,
            label: Text(filterTag.label),
            labelStyle: TextStyle(
              color: filterTag.isSelected ? K.accentColor : K.secondaryColor,
              fontSize: 12.0,
            ),
            selected: filterTag.isSelected,
            onSelected: onSelected,
            showCheckmark: filterTag.isSelected,
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
      );
}

class _FilterTagBarWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const _FilterTagBarWidget({Key? key, required this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: K.secondaryColor.withOpacity(0.10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              InkWell(
                onTap: onTap,
                child: const Icon(
                  LucideIcons.x,
                  size: 12.0,
                  color: K.primaryColor,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
      ],
    );
  }
}
