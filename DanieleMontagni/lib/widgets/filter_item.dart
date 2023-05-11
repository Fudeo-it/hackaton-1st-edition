import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/mocks.dart';

class FilterItem extends StatefulWidget {
  final Filtro? filtro;
  final void Function()? onQueryChanged;

  FilterItem({
    this.filtro,
    this.onQueryChanged,
  });

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: widget.onQueryChanged,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: widget.filtro!.selected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).primaryColor,
          ),
          child: Row(
            children: [
              if (widget.filtro!.icon != null)
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.filtro!.selected
                        ? Theme.of(context).primaryColorDark
                        : null,
                  ),
                  child: Icon(
                    widget.filtro!.icon,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 16,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.filtro!.name,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: widget.filtro!.selected
                            ? Theme.of(context).primaryColor
                            : null,
                        fontSize: 16,
                      ),
                ),
              ),
            ],
          ),
        ),
      );
}
