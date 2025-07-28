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
  createClient(
    name: 'createClient',
    path: '/clients/new',
  ),
  users(
    name: 'users',
    path: '/users',
  ),
  createUser(
    name: 'createUser',
    path: '/users/new',
  ),
  profile(
    name: 'profile',
    path: '/profile',
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
