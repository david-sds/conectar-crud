import 'package:conectar_frontend/data/repositories/clients_repository.dart';
import 'package:conectar_frontend/data/repositories/users_repository.dart';
import 'package:conectar_frontend/ui/auth/viewmodel/auth_viewmodel.dart';
import 'package:conectar_frontend/ui/clients/viewmodel/clients_viewmodel.dart';
import 'package:conectar_frontend/ui/users/viewmodel/users_viewmodel.dart';
import 'package:provider/provider.dart';

final providers = [
  Provider(create: (_) => ClientsRepository()),
  Provider(create: (_) => UsersRepository()),
  ChangeNotifierProvider(create: (_) => AuthViewmodel()),
  ChangeNotifierProvider(
    create: (context) => ClientsViewmodel(
      clientsRepository: context.read<ClientsRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => UsersViewmodel(
      usersRepository: context.read<UsersRepository>(),
    ),
  ),
];
