// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_contact_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarketContactModelAdapter extends TypeAdapter<MarketContactModel> {
  @override
  final int typeId = 2;

  @override
  MarketContactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MarketContactModel(
      id: fields[0] as int?,
      market: fields[1] as int?,
      firstMobileNumber: fields[2] as String?,
      secondMobileNumber: fields[3] as String?,
      telephone: fields[4] as String?,
      fax: fields[5] as String?,
      email: fields[6] as String?,
      websiteUrl: fields[7] as String?,
      instagramId: fields[8] as String?,
      telegramId: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MarketContactModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.market)
      ..writeByte(2)
      ..write(obj.firstMobileNumber)
      ..writeByte(3)
      ..write(obj.secondMobileNumber)
      ..writeByte(4)
      ..write(obj.telephone)
      ..writeByte(5)
      ..write(obj.fax)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.websiteUrl)
      ..writeByte(8)
      ..write(obj.instagramId)
      ..writeByte(9)
      ..write(obj.telegramId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarketContactModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
