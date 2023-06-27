import 'dart:async';

import 'package:api_clientes/app/domain/domain.dart';
import 'package:api_clientes/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late MockConnection connection;
  late GetClientesDAO dao;

  setUpAll(() {
    connection = MockConnection();
    dao = GetClientesDAO(connection: connection);
  });

  group('GetClientesDAO', () {
    test('dever retornar uma lista de clientes', () async {
      when(() => connection.query(any())).thenAnswer(
        (_) async => [
          {
            'id': 1,
            'nome': 'nome',
            'email': 'email@email.com',
            'telefone': '7777-7777',
          },
        ],
      );

      when(() => connection.close()).thenAnswer((_) async => Completer<void>().complete());
      final result = await dao.call();

      expect(result, isA<List<Cliente>>());
    });
  });
}
