import 'package:loggy/loggy.dart';

mixin DatasourceLoggy implements LoggyType {
  @override
  Loggy<DatasourceLoggy> get loggy =>
      Loggy<DatasourceLoggy>('Datasource Loggy - $runtimeType');
}
