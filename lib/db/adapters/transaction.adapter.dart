import 'package:hive/hive.dart';

import '../../models/category.model.dart';
import '../../models/tipo_transacao.model.dart';
import '../../models/transaction.model.dart';

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 0;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      id: fields[0] as String?,
      titulo: fields[1] as String,
      descricao: fields[2] as String,
      valor: fields[3] == null ? 0.0 : fields[3] as double,
      tipoTransacao: fields[4] as TipoTransacao,
      data: fields[5] as DateTime,
      category: fields[6] as Category,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titulo)
      ..writeByte(2)
      ..write(obj.descricao)
      ..writeByte(3)
      ..write(obj.valor)
      ..writeByte(4)
      ..write(obj.tipoTransacao)
      ..writeByte(5)
      ..write(obj.data)
      ..writeByte(6)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
