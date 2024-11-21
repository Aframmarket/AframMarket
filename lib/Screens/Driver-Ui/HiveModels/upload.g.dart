// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UploadAdapter extends TypeAdapter<Upload> {
  @override
  final int typeId = 2;

  @override
  Upload read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Upload(
      filepath: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Upload obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.filepath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
