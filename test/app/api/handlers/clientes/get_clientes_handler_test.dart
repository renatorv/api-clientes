import 'package:api_clientes/app/api/api.dart';
import 'package:test/test.dart';

class Container {
// status = ok, notFound, noContent, internalServerError
// body   = Lista de clientes, mensagem de erro
}

void main() {
  test('Deve retornar uma instancia de ResponseHandler', () async {
    final handler = GetClientesHandler();
    final result = await handler.call();

    expect(result, isA<ResponseHandler>());
  });

  test('Deve retornar um status OK', () async {
    final handler = GetClientesHandler();
    final result = await handler.call();

    expect(result.status, StatusHandler.ok);
  });

  test('Deve retornar uma lista de ClienteOutputDTO', () async {
    final handler = GetClientesHandler();
    final result = await handler.call();

    expect(result.body, isA<List<ClienteOutputDTO>>());
  });
}
