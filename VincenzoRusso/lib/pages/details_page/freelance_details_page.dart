import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/job_details_bloc/job_details_bloc.dart';
import 'package:offertelavoroflutter_app/models/enum/relationship.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/pages/details_page/widgets/rich_text_row.dart';
import 'package:offertelavoroflutter_app/pages/details_page/widgets/select_row.dart';
import 'package:offertelavoroflutter_app/pages/details_page/widgets/text_row.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_app/repositories/url_launcher_repository.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:offertelavoroflutter_app/widgets/card_notification.dart';
import 'package:offertelavoroflutter_app/widgets/error_popup_widget.dart';
import 'package:offertelavoroflutter_app/widgets/flutter_job_loader.dart';
import 'package:offertelavoroflutter_app/widgets/job_flutter_button.dart';

@RoutePage()
class FreelanceDetailsPage extends StatelessWidget with AutoRouteWrapper {
  final String jobID;

  const FreelanceDetailsPage({
    required this.jobID,
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<JobDetailsBloc>(
            create: (context) => JobDetailsBloc(
              context.read<JobRepository>(),
            )..fetchJobFreelance(jobID),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<JobDetailsBloc, JobDetailsState>(
          builder: (context, state) {
            if (state is FetchingJobDetailsState) {
              return const Center(
                child: FlutterJobLoader(),
              );
            }

            if (state is ErrorJobDetailsState) {
              return const CardNotification(
                title: "Si è verificato un errore",
                message: "Non è possibile caricare o trovare l'annuncio.",
                error: true,
              );
            }

            if (state is FetchedJobFreelanceDetailsState) {
              return _FreelanceDetailsContent(
                job: state.job,
              );
            }

            return const SizedBox();
          },
        ),
      );
}

class _FreelanceDetailsContent extends StatelessWidget {
  final JobFreelance job;

  const _FreelanceDetailsContent({
    required this.job,
  });

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () async =>
            context.read<JobDetailsBloc>().fetchJobFreelance(job.id),
        color: AppColors.primaryLight,
        edgeOffset: 200.0,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () => context.router.pop(),
                icon: const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  size: 24.0,
                ),
              ),
              expandedHeight: 100,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "${job.emoji} Specifiche Progetto",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryLight,
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              actions: [
                BlocBuilder<FavouriteJobBloc, FavouriteJobState>(
                  builder: (context, state) {
                    if (state is LoadedFavouriteJobState) {
                      final isFavourite = state.favouriteJob.any(
                        (favorite) => favorite.id == job.id,
                      );

                      return IconButton(
                        onPressed: () => isFavourite
                            ? context.read<FavouriteJobBloc>().removeFavourite(
                                  FavouriteJob.fromFreelance(job),
                                )
                            : context.read<FavouriteJobBloc>().addFavourite(
                                  FavouriteJob.fromFreelance(job),
                                ),
                        icon: FaIcon(
                          isFavourite
                              ? FontAwesomeIcons.solidBookmark
                              : FontAwesomeIcons.bookmark,
                          size: 24.0,
                        ),
                      );
                    }

                    return IconButton(
                      onPressed: () => state is NoFavouriteJobState
                          ? context.read<FavouriteJobBloc>().addFavourite(
                                FavouriteJob.fromFreelance(job),
                              )
                          : null,
                      icon: const FaIcon(
                        FontAwesomeIcons.bookmark,
                        size: 24.0,
                      ),
                    );
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: job.archived
                    ? CardNotification(
                        title: "Ci dispiace!",
                        message:
                            "Questo annuncio non è più disponibile se vuoi puoi eliminarlo dai preferiti",
                        child: JobFlutterButton(
                          child: Text(
                            "Elimina",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          onPressed: () {
                            context.read<FavouriteJobBloc>().removeFavourite(
                                  FavouriteJob.fromFreelance(job),
                                );
                            context.router.pop();
                          },
                        ),
                      )
                    : Column(
                        children: [
                          RichTextRow(
                            label: "Descrizione del progetto",
                            texts: job.description,
                          ),
                          RichTextRow(
                            label: "Richiesta di lavoro",
                            texts: job.jobApplication,
                          ),
                          SelectRow(
                            label: "Tipo di relazione",
                            selectLabel: job.relationship.getString,
                            backgroundColor: job.relationship.color,
                            color: job.relationship.colorText,
                          ),
                          TextRow(
                            label: "Tempistiche",
                            text: job.timelines,
                          ),
                          TextRow(
                            label: "Budget",
                            text: job.budget,
                          ),
                          TextRow(
                            label: "Tempistiche di pagamento",
                            text: job.paymentTiming,
                          ),
                          TextRow(
                            label: "NDA",
                            text: job.nda ? "Si" : "No",
                          ),
                          TextRow(
                            label: "Come candidarsi",
                            text: job.toApply,
                            underline: true,
                            onPressed: () async {
                              try {
                                await context
                                    .read<UrlLauncherRepository>()
                                    .launchMyUrl(job.toApply);
                              } catch (e) {
                                _showErrorModal(
                                  context,
                                  e is ErrorLauncher
                                      ? e.text ?? ''
                                      : 'C\'è stato un errore',
                                );
                              }
                            },
                          ),
                          TextRow(
                            label: "Job Posted",
                            text: DateFormat("dd/MM/y  H:m")
                                .format(job.jobPosted),
                          ),
                          const SizedBox(height: 40.0),
                        ],
                      ),
              ),
            ),
          ],
        ),
      );

  void _showErrorModal(
    BuildContext context,
    String errorMessage,
  ) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: true,
      barrierColor: AppColors.transparent,
      builder: (BuildContext context) => ErrorPopupWidget(
        title: "⚠️\nErrore",
        subtitle: errorMessage,
      ),
    );
  }
}
