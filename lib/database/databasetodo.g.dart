// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databasetodo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAdapter extends TypeAdapter<ModelTodo> {
  @override
  final int typeId = 2;

  @override
  ModelTodo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelTodo(
      fields[2] as String,
      fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ModelTodo obj) {
    writer
      ..writeByte(2)
      ..writeByte(2)
      ..write(obj.titleActivity)
      ..writeByte(3)
      ..write(obj.checkActivity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
