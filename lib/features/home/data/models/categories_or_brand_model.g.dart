// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_or_brand_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllCategoriesOrBrandsAdapter extends TypeAdapter<AllCategoriesOrBrands> {
  @override
  final int typeId = 10;

  @override
  AllCategoriesOrBrands read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllCategoriesOrBrands(
      results: fields[0] as int?,
      metadata: fields[1] as Metadata?,
      data: (fields[2] as List?)?.cast<CategoryDataOrBrands>(),
    );
  }

  @override
  void write(BinaryWriter writer, AllCategoriesOrBrands obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.results)
      ..writeByte(1)
      ..write(obj.metadata)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllCategoriesOrBrandsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryDataOrBrandsAdapter extends TypeAdapter<CategoryDataOrBrands> {
  @override
  final int typeId = 11;

  @override
  CategoryDataOrBrands read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryDataOrBrands(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      image: fields[3] as String?,
      createdAt: fields[4] as String?,
      updatedAt: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryDataOrBrands obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDataOrBrandsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetadataAdapter extends TypeAdapter<Metadata> {
  @override
  final int typeId = 12;

  @override
  Metadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Metadata(
      currentPage: fields[0] as int?,
      numberOfPages: fields[1] as int?,
      limit: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Metadata obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.currentPage)
      ..writeByte(1)
      ..write(obj.numberOfPages)
      ..writeByte(2)
      ..write(obj.limit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
