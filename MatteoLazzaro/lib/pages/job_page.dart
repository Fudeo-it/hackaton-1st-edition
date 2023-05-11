import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/models/job.dart';
import 'package:url_launcher/url_launcher.dart';

class JobPage extends StatelessWidget {
  final Job job;
  const JobPage(this.job, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            job.name,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Text('Nome Azienda:'),
              trailing: Text(job.nomeAzienda),
            ),
            ListTile(
              leading: const Text('URL sito web:'),
              trailing: Text(job.urlSitoWeb ?? 'Empty'),
            ),
            ListTile(
              leading: const Text('Qualifica:'),
              trailing: Text(job.qualifica ?? 'Empty'),
            ),
            ListTile(
              leading: const Text('Seniority:'),
              trailing: Text(job.team == Seniority.junior
                  ? 'Junior'
                  : job.team == Seniority.mid
                      ? 'Mid'
                      : job.team == Seniority.senior
                          ? 'Senior'
                          : 'Empty'),
            ),
            ListTile(
              leading: const Text('Team:'),
              trailing: Text(job.team == Team.inSede
                  ? 'In sede'
                  : job.team == Team.ibrido
                      ? 'Ibrido'
                      : job.team == Team.fullRemote
                          ? 'Full remote'
                          : 'Empty'),
            ),
            ListTile(
              leading: const Text('Contratto:'),
              trailing: Text(job.team == Contratto.fullTime
                  ? 'Full time'
                  : job.team == Contratto.partTime
                      ? 'Part time'
                      : 'Empty'),
            ),
            ListTile(
              leading: const Text('Retribuzione:'),
              trailing: Text(job.retribuzione ?? 'Empty'),
            ),
            Column(
              children: [
                const Text(
                  'Descrizione offerta:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: job.descrizioneOfferta,
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Come candidarsi:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Uri.tryParse(job.comeCandidarsi)!.hasAbsolutePath
                        ? launchUrl(Uri.parse(job.comeCandidarsi))
                        : null;
                  },
                  child: Text(
                    job.comeCandidarsi,
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: const Text('Job posted:'),
              trailing: Text(job.jobPosted.toString()),
            ),
            ListTile(
              leading: const Text('Località:'),
              trailing: Text(job.localita ?? 'Empty'),
            ),
          ],
        ),
      ),
    );
  }
}
