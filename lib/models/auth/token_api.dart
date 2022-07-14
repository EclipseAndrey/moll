

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TokenApi {




  @HiveField(0)
  String access_token;
  @HiveField(1)
  DateTime expires_in;
  @HiveField(2)
  int refresh_expires_in;
  @HiveField(3)
  String refresh_token;
  @HiveField(4)
  String token_type;
  @HiveField(5)
  String? id_token;
  @HiveField(6)
  int? notBeforePolicy;
  @HiveField(7)
  String? session_state;
  @HiveField(8)
  String? scope;


  TokenApi({
    required this.access_token,
    required this.expires_in,
    required this.refresh_expires_in,
    required this.refresh_token,
    required this.token_type,
    required this.id_token,
    required this.notBeforePolicy,
    required this.session_state,
    required this.scope,
  });



  factory TokenApi.fromMap(Map<String, dynamic> map) {
    return TokenApi(
      access_token: map["access_token"],
      expires_in: DateTime.now().add(Duration(seconds: map["expires_in"] - 300)),
      refresh_expires_in: map["refresh_expires_in"],
      refresh_token: map["refresh_token"],
      token_type: map["token_type"],
      id_token: map["id_token"],
      notBeforePolicy: map["not-before-policy"],
      session_state: map["session_state"],
      scope: map["scope"],
    );
  }

  Map<String, dynamic> toMap() => {
    "access_token" : access_token,
    "expires_in" : expires_in,
    "refresh_expires_in" : refresh_expires_in,
    "token_type" : token_type,
    "id_token" : id_token,
    "not-before-policy" : notBeforePolicy,
    "session_state" : session_state,
    "scope" : scope,
  };




}

class TokensApiAdapter extends TypeAdapter<TokenApi> {
  @override
  final int typeId = 0;


  @override
  TokenApi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenApi(
      access_token: fields[0] as String,
      expires_in: fields[1] as DateTime,
      refresh_expires_in: fields[2] as int,
      refresh_token: fields[3] as String,
      token_type: fields[4] as String,
      id_token: fields[5] ,
      notBeforePolicy: fields[6],
      session_state: fields[7] ,
      scope: fields[8] ,
    );

  }



  @override
  void write(BinaryWriter writer, TokenApi obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.access_token)
      ..writeByte(1)
      ..write(obj.expires_in)
      ..writeByte(2)
      ..write(obj.refresh_expires_in)
      ..writeByte(3)
      ..write(obj.refresh_token)
      ..writeByte(4)
      ..write(obj.token_type)
      ..writeByte(5)
      ..write(obj.id_token)
      ..writeByte(6)
      ..write(obj.notBeforePolicy)
      ..writeByte(7)
      ..write(obj.session_state)
      ..writeByte(8)
      ..write(obj.scope);
  }



}