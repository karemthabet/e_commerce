// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 4;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      sold: fields[0] as int?,
      images: (fields[1] as List?)?.cast<String>(),
      subcategory: (fields[2] as List?)?.cast<Subcategory>(),
      ratingsQuantity: fields[3] as int?,
      id: fields[4] as String?,
      title: fields[5] as String?,
      slug: fields[6] as String?,
      description: fields[7] as String?,
      quantity: fields[8] as int?,
      price: fields[9] as int?,
      imageCover: fields[10] as String?,
      category: fields[11] as Category?,
      brand: fields[12] as Brand?,
      ratingsAverage: fields[13] as double?,
      createdAt: fields[14] as String?,
      updatedAt: fields[15] as String?,
      isFavorite: fields[16] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.sold)
      ..writeByte(1)
      ..write(obj.images)
      ..writeByte(2)
      ..write(obj.subcategory)
      ..writeByte(3)
      ..write(obj.ratingsQuantity)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.slug)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.quantity)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.imageCover)
      ..writeByte(11)
      ..write(obj.category)
      ..writeByte(12)
      ..write(obj.brand)
      ..writeByte(13)
      ..write(obj.ratingsAverage)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.updatedAt)
      ..writeByte(16)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
