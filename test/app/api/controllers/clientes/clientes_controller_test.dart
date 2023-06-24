import 'package:api_clientes/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

/// Controllers
///
/// route: /clientes => clientesController
/// metodos: GET POST ...
/// Handlers: ações dos pedidos
///
/// key: valor
/// GET: lista de clientes => handler
/// GET /{clienteId}: pesquisa de um cliente
/// PUT /{clienteId}: atualizando um cliente

void main() {
  late ClientesController controller;
  late MockGetClientesUseCase mockGetClientesUseCase;

  setUpAll(() {
    mockGetClientesUseCase = MockGetClientesUseCase();
    controller = ClientesController(getClientesUseCase: mockGetClientesUseCase);
  });

  group('ClientesController:', () {
    test('deve conter uma route "clientes"', () async {
      expect(controller.route, '/clientes');
    });

    test('deve conter uma key "GET" para o handler GetClientesHandler', () async {
      expect(controller.handlers['GET'], isA<GetClientesHandler>());
    });
  });
}
