import 'package:loggy/loggy.dart';

mixin ApiClientLoggy implements LoggyType {
  @override
  Loggy<ApiClientLoggy> get loggy =>
      Loggy<ApiClientLoggy>('Api client Loggy - $runtimeType');
}
