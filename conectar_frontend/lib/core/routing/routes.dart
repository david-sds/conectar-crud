enum Routes {
  initial(
    name: 'initial',
    path: '/',
  ),
  login(
    name: 'login',
    path: '/login',
  ),
  clients(
    name: 'clients',
    path: '/clients',
  ),
  users(
    name: 'users',
    path: '/users',
  );

  const Routes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  String get detailPath => '$path/:id';
  String get detailName => '${name}Detail';
}
