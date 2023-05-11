import 'package:annunci_lavoro_flutter/cubits/dark_mode_cubit.dart';
import 'package:annunci_lavoro_flutter/models/job_positions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeniorityContainer extends StatelessWidget {
  ///
  /// Container che mostra le info di tipo [Seniority]
  /// e cambia colore in base al tema.
  ///
  final JobPosition jobPosition;
  const SeniorityContainer({
    super.key,
    required this.jobPosition,
  });

  @override
  Widget build(BuildContext context) => jobPosition.seniority == null
      ? Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey.shade200,
          ),
          child: Text(
            'Empty',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                  fontSize: 20,
                ),
          ),
        )
      : BlocBuilder<DarkModeCubit, bool>(
          builder: (context, darkMode) {
            return Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: jobPosition.getSeniorityColor(
                    jobPosition.seniority!, darkMode),
              ),
              child: Text(
                jobPosition.mapSeniorityString() ?? '-',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
              ),
            );
          },
        );
}
