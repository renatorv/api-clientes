part of api;

abstract class Handler {}

class GetClientesHandler implements Handler {}

abstract class Controller {
  final String route;
  final Map<String, Handler> handlers;

  Controller({
    required this.route,
    required this.handlers,
  });
}

class ClientesController implements Controller {
  @override
  String get route => '/clientes';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientesHandler(),
      };
}
