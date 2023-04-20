import 'package:avaliacao_mobile/models/tipo_transacao.model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import 'category.model.dart';
//part "transaction.model.g.dart";

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String titulo;
  @HiveField(2)
  late String descricao;
  @HiveField(3, defaultValue: 0.0)
  late double valor;
  @HiveField(4)
  late TipoTransacao tipoTransacao;
  @HiveField(5)
  late DateTime data;
  @HiveField(6)
  late Category category;
  /*  @HiveField(7)
  late String categoryId; */
  Transaction({
    String? id,
    /*  String? categoryId, */
    required this.titulo,
    required this.descricao,
    required this.valor,
    required this.tipoTransacao,
    required this.data,
    required this.category,
  }) {
    this.id = id ?? const Uuid().v4();
    /*  this.categoryId = categoryId ?? ""; */
  }
}
