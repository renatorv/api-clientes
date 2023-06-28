import 'package:api_clientes/config/config.dart';
import 'package:api_clientes/server/server.dart';

void main() {
  Server.bootstrap(controllers)
      .then(
        (server) => print('Server listening on port ${server.port}'),
      )
      .catchError(print);
}
