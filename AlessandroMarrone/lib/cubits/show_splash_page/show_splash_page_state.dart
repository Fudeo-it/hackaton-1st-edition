part of 'show_splash_page_cubit.dart';

class ShowSplashPageState extends Equatable {
  final bool enableSpashPage;
  const ShowSplashPageState(this.enableSpashPage);

  @override
  List<Object> get props => [enableSpashPage];
}
