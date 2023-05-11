import 'package:annunci_lavoro_flutter/blocs/jobAds/bloc/job_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/models/job_positions_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContractDropDown extends StatefulWidget {
  ///
  /// dropdown per aggiungere i filtri di tipo [ContractType]
  ///
  final String hintText = 'Contratto';
  final List<String> items = ['Part time', 'Full time'];
  ContractDropDown({
    super.key,
  });

  @override
  State<ContractDropDown> createState() => _ContractDropDownState();
}

class _ContractDropDownState extends State<ContractDropDown> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  widget.hintText,
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              items: widget.items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  enabled: false,
                  child: StatefulBuilder(
                    builder: (context, menuSetState) {
                      final isSelected = selectedItems.contains(item);
                      return InkWell(
                        onTap: () {
                          isSelected ? removeFilter(item) : addFilter(item);

                          setState(() {});

                          menuSetState(() {});
                        },
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              isSelected
                                  ? const Icon(Icons.check_box_outlined)
                                  : const Icon(Icons.check_box_outline_blank),
                              const SizedBox(width: 10),
                              Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              value: selectedItems.isEmpty ? null : selectedItems.last,
              onChanged: (value) {},
              selectedItemBuilder: (context) {
                return widget.items.map(
                  (item) {
                    return Container(
                      alignment: AlignmentDirectional.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        selectedItems.join(', '),
                        style: const TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    );
                  },
                ).toList();
              },
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 36,
                width: 100,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.zero,
              ),
              dropdownStyleData: DropdownStyleData(
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  offset: const Offset(0, -3)),
            ),
          ),
        ),
        _filterActiveIndicator(),
      ],
    );
  }

  /// listener che mostra il circleAvatar per segnalare all'utente che è attivo ul filtro.
  Widget _filterActiveIndicator() => ValueListenableBuilder<bool>(
        valueListenable: BlocProvider.of<JobAdsBloc>(context)
            .jobAdsController
            .isContractFiltersEmpty,
        builder: ((context, value, child) => !value
            ? Positioned(
                bottom: 5,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.orangeAccent.shade700,
                  radius: 5,
                ),
              )
            : const SizedBox()),
      );
// metodo che aggiunge un filtro nella lista del controller.
  void addFilter(String item) {
    final ContractType? type = JobPosition.mapContractEnum(item);

    if (type != null) {
      BlocProvider.of<JobAdsBloc>(context)
          .jobAdsController
          .addContractFilter(type);
      selectedItems.add(item);
    }
  }

// metodo che rimuove un filtro nella lista del controller.
  void removeFilter(String item) {
    final ContractType? type = JobPosition.mapContractEnum(item);

    if (type != null) {
      BlocProvider.of<JobAdsBloc>(context)
          .jobAdsController
          .removeContractFilter(type);
      selectedItems.remove(item);
    }
  }
}
