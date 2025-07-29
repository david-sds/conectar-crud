import 'package:conectar_frontend/core/extensions/string_extension.dart';
import 'package:conectar_frontend/domain/models/user_details/user_details_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    required this.userDetails,
    super.key,
  });

  final UserDetails userDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(36.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minRadius: 50,
                child: Text(
                  userDetails.name?.initials() ?? '-',
                  style: const TextStyle(fontSize: 42),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userDetails.name ?? '-',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userDetails.email ?? '-',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    userDetails.role?.label ?? '-',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    userDetails.createdAt != null
                        ? 'Conta criada em ${DateFormat("dd/MM/yyyy 'às' HH:mm", 'pt_BR').format(userDetails.createdAt!.toLocal())}'
                        : '',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
