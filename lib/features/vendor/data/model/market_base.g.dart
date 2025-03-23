// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_base.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarketBaseModelAdapter extends TypeAdapter<MarketBaseModel> {
  @override
  final int typeId = 1;

  @override
  MarketBaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MarketBaseModel(
      id: fields[0] as int?,
      marketType: fields[1] as String,
      businessId: fields[2] as String,
      name: fields[3] as String,
      description: fields[4] as String,
      subCategory: fields[5] as int,
      slogan: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MarketBaseModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.marketType)
      ..writeByte(2)
      ..write(obj.businessId)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.subCategory)
      ..writeByte(6)
      ..write(obj.slogan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarketBaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
