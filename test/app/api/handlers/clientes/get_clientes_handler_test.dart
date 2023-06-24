import 'package:api_clientes/app/api/api.dart';
import 'package:api_clientes/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

// class Container {
// // status = ok, notFound, noContent, internalServerError
// // body   = Lista de clientes, mensagem de erro
// }

void main() {
  late GetClientesHandler handler;
  late MockGetClientesUseCase mockGetClientesUseCase;

  setUpAll(() {
    mockGetClientesUseCase = MockGetClientesUseCase();
    handler = GetClientesHandler(getClientesUseCase: mockGetClientesUseCase);
  });

  group('GetClientesHandler:', () {
    test('Deve retornar uma instancia de ResponseHandler', () async {
      when(() => mockGetClientesUseCase.call()).thenAnswer((_) async => []);

      final result = await handler.call();

      expect(result, isA<ResponseHandler>());
    });

    test('Deve retornar um status OK', () async {
      when(() => mockGetClientesUseCase.call()).thenAnswer((_) async => []);

      final result = await handler.call();

      expect(result.status, StatusHandler.ok);
    });

    test('Deve retornar uma lista de ClienteOutputDTO', () async {
      when(() => mockGetClientesUseCase.call()).thenAnswer(
        (_) async => [
          Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone'),
        ],
      );
      final result = await handler.call();

      expect(result.body, isA<List<ClienteOutputDTO>>());
    });

    test('Deve retornar um status internalServerError quando um erro desconhecido acontecer', () async {
      when(() => mockGetClientesUseCase.call()).thenThrow(Exception());
      final result = await handler.call();

      expect(result.status, StatusHandler.internalServerError);
    });
  });
}
