part of infra;

class GetClientesDAO implements GetClientesGateway {
  // Aqui como é onde será a conexão com o BD, assim temos uma dependência aqui
  final Connection connection;

  GetClientesDAO({required this.connection});
  @override
  Future<List<Cliente>> call() async {
    try {
      final rows = await connection.query('SELECT * FROM clientes');

      return rows.map((ClienteDB.toEntity)).toList();
    } finally {
      await connection.close();
    }
  }
}
