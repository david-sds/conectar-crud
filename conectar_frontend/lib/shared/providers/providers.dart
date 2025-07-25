import 'package:conectar_frontend/ui/auth/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider(create: (_) => AuthViewmodel()),
];
