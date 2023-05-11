import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/models/job.dart';
import 'package:offertelavoroflutter/pages/job_page.dart';

class JobWidget extends StatelessWidget {
  final Job job;
  const JobWidget(this.job, {super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(25),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(job.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                JobContentWidget(job),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JobPage(job),
              ));
        },
      );
}

class JobContentWidget extends StatelessWidget {
  final Job job;
  const JobContentWidget(this.job, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(job.nomeAzienda)],
    );
  }
}
