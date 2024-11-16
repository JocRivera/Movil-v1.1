import 'package:flutter/material.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  const Navbar({super.key});
  @override
  State<Navbar> createState() => _NavbarState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Bookedge'),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        PopupMenuButton(
          icon: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/57899051?v=4',
            ),
          ),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            const PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Perfil'),
              ),
            ),
            const PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Cerrar sesión'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
