library infra;

import 'package:api_clientes/app/data/data.dart';
import 'package:api_clientes/app/domain/domain.dart';

part 'dao/clientes/get_clientes_dao.dart';
part 'connection/connection.dart';

class ClienteDB {
  ClienteDB._();
  static Cliente toEntity(Map<String, dynamic> row) {
    return Cliente(
      id: row['id'],
      nome: row['nome'],
      email: row['email'],
      telefone: row['telefone'],
    );
  }
}
