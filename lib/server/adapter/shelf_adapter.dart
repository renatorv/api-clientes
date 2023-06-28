part of '../server.dart';

class ShelfAdapter {
  final List<Controller> controllers;

  ShelfAdapter({required this.controllers});

  void handle(Router router) {
    for (final controller in controllers) {
      _handler(controller, router);
    }
  }

  void _handler(Controller controller, Router router) {
    final route = controller.route; // path => ex. /clientes.... /produtos
    final handlers = controller.handlers; // VERBO => GET ...

    // PEGAR O VERBO
    for (final myHandler in handlers.entries) {
      final verb = myHandler.key;
      router.add(verb, route, (Request request) async {
        final responseHandler = await myHandler.value();

        switch (responseHandler.status) {
          case StatusHandler.ok:
            return Response.ok(responseHandler.body);
          case StatusHandler.internalServerError:
            break;
        }
      });
    }
  }
}
