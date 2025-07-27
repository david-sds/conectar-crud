import 'package:conectar_frontend/ui/auth/viewmodel/auth_viewmodel.dart';
import 'package:conectar_frontend/ui/clients/viewmodel/clients_viewmodel.dart';
import 'package:conectar_frontend/ui/users/viewmodel/users_viewmodel.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider(create: (_) => AuthViewmodel()),
  ChangeNotifierProvider(create: (_) => ClientsViewmodel()),
  ChangeNotifierProvider(create: (_) => UsersViewmodel()),
];
