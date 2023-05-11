import 'package:loggy/loggy.dart';

mixin RepositoryLoggy implements LoggyType {
  @override
  Loggy<RepositoryLoggy> get loggy =>
      Loggy<RepositoryLoggy>('Repository Loggy - $runtimeType');
}
