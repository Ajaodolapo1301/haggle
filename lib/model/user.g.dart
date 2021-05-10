// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  User read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      phonenumber: fields[2] as String,
      email: fields[0] as String,
      id: fields[1] as String,
      token: fields[3] as String,
      emailVerified: fields[4] as bool,
      username: fields[5] as String,
      country: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.phonenumber)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.emailVerified)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.country);
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;
}
