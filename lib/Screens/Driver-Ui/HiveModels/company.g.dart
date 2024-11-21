// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyAdapter extends TypeAdapter<Company> {
  @override
  final int typeId = 1;

  @override
  Company read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Company(
      id: fields[0] as int,
      businessName: fields[1] as String,
      address: fields[2] as String,
      city: fields[3] as String,
      state: fields[4] as String,
      zipCode: fields[5] as String,
      categories: fields[6] as int,
      bankName: fields[7] as String,
      accountNo: fields[8] as String,
      accountName: fields[9] as String,
      userId: fields[10] as int,
      status: fields[11] as int,
      dateCreated: fields[12] as String,
      statusUpdateDate: fields[13] as String,
      wallet: fields[14] as String,
      paypalEmail: fields[15] as String,
      vehicleType: fields[16] as String,
      hasAgreed: fields[17] as int,
      firstname: fields[18] as String,
      lastname: fields[19] as String,
      uploads: (fields[20] as List).cast<Upload>(),
    );
  }

  @override
  void write(BinaryWriter writer, Company obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.businessName)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.zipCode)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.bankName)
      ..writeByte(8)
      ..write(obj.accountNo)
      ..writeByte(9)
      ..write(obj.accountName)
      ..writeByte(10)
      ..write(obj.userId)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.dateCreated)
      ..writeByte(13)
      ..write(obj.statusUpdateDate)
      ..writeByte(14)
      ..write(obj.wallet)
      ..writeByte(15)
      ..write(obj.paypalEmail)
      ..writeByte(16)
      ..write(obj.vehicleType)
      ..writeByte(17)
      ..write(obj.hasAgreed)
      ..writeByte(18)
      ..write(obj.firstname)
      ..writeByte(19)
      ..write(obj.lastname)
      ..writeByte(20)
      ..write(obj.uploads);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
