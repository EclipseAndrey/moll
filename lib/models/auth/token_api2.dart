


import 'package:hive/hive.dart';
import 'package:moll/models/auth/token_api.dart';

@HiveType(typeId: 1)
class TokenApi2 extends HiveObject {

  @HiveField(0)
  late TokenApi tokenApi;



}

class TokensAdapter extends TypeAdapter<TokenApi2> {
  @override
  final int typeId = 1;

  @override
  TokenApi2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenApi2()
    ..tokenApi = fields[0] as TokenApi;
  }

  @override
  void write(BinaryWriter writer, TokenApi2 obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.tokenApi);
  }




}



