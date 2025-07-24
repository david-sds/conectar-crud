enum Routes {
  login(
    name: 'login',
    path: '/login',
  ),
  home(
    name: 'home',
    path: '/home',
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
