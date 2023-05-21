import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Bem vindo Usuário'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.data_saver_on),
            title: Text('Dados da Fazenda'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.DATAIL_FARMS);
            },
          ),
        ],
      ),
    );
  }
}
