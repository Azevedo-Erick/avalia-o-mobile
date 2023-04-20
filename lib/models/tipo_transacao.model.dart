import 'package:hive/hive.dart';

//part "tipo_transacao.model.g.dart";

@HiveType(typeId: 2)
enum TipoTransacao {
  @HiveField(0)
  entrada,
  @HiveField(1)
  gasto
}
