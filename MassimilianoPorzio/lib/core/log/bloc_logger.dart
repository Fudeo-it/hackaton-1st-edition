import 'package:loggy/loggy.dart';

mixin BlocLoggy implements LoggyType {
  @override
  Loggy<BlocLoggy> get loggy => Loggy<BlocLoggy>('Bloc Loggy - $runtimeType');
}
