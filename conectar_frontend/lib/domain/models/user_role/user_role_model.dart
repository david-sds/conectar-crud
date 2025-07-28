enum UserRole {
  admin('ADMIN', 'Administrador'),
  user('USER', 'Usuário');

  final String value;
  final String label;

  const UserRole(this.value, this.label);
}
