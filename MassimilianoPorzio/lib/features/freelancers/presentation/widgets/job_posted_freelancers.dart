import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_app/features/freelancers/domain/entities/annuncio_freelancer.dart';

class JobPostedFreelancers extends StatelessWidget {
  const JobPostedFreelancers({
    super.key,
    required this.annuncio,
  });

  final AnnuncioFreelancers annuncio;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.schedule_sharp,
          size: 12,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          DateFormat('dd/MM/yyyy HH:mm').format(annuncio.jobPosted),
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
