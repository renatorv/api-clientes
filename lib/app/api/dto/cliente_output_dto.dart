part of api;

class ClienteOutputDTO {
  final int id;
  final String nome;
  final String email;
  final String telefone;

  ClienteOutputDTO({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
  });

  // ClienteOutputDTO.toDTO e toCollectionDTO, criados na aula 4 [por volta de 13 minutos]
  factory ClienteOutputDTO.toDTO(Cliente cli) {
    return ClienteOutputDTO(
      id: cli.id,
      nome: cli.nome,
      email: cli.email,
      telefone: cli.telefone,
    );
  }

  static List<ClienteOutputDTO> toCollectionDTO(List<Cliente> clientes) {
    return clientes.map(ClienteOutputDTO.toDTO).toList();
  }
}
