import 'package:hive/hive.dart';

import '../../models/tipo_transacao.model.dart';

class TipoTransacaoAdapter extends TypeAdapter<TipoTransacao> {
  @override
  final int typeId = 2;

  @override
  TipoTransacao read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TipoTransacao.entrada;
      case 1:
        return TipoTransacao.gasto;
      default:
        return TipoTransacao.entrada;
    }
  }

  @override
  void write(BinaryWriter writer, TipoTransacao obj) {
    switch (obj) {
      case TipoTransacao.entrada:
        writer.writeByte(0);
        break;
      case TipoTransacao.gasto:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TipoTransacaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
