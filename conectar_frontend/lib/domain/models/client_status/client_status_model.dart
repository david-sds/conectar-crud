enum ClientStatus {
  active('ACTIVE', 'Ativo'),
  inactive('INACTIVE', 'Inativo');

  final String value;
  final String label;

  const ClientStatus(this.value, this.label);
}
