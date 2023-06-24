import 'package:api_clientes/app/api/api.dart';
import 'package:api_clientes/app/domain/domain.dart';
import 'package:test/test.dart';

void main() {
  test('Deve retornar uma lista de ClienteOutputDTO', () async {
    final result = ClienteOutputDTO.toCollectionDTO([
      Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone'),
    ]);
    expect(result, isA<List<ClienteOutputDTO>>());
  });
}
