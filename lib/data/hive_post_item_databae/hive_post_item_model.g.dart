// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_post_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostItemHiveAdapter extends TypeAdapter<PostItemHive> {
  @override
  final int typeId = 0;

  @override
  PostItemHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostItemHive(
      id: fields[0] as String,
      title: fields[1] as String,
      author: fields[2] as String,
      ups: fields[3] as int,
      numberOfComments: fields[4] as int,
      createdAt: fields[5] as DateTime,
      fromHive: fields[6] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, PostItemHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.ups)
      ..writeByte(4)
      ..write(obj.numberOfComments)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.fromHive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostItemHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
