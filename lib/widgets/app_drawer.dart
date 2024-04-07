import 'package:flutter/material.dart';
import 'package:pokemon_app/global-functions-and-variables/global_variables.dart';
import 'package:pokemon_app/widgets/custom_drawer_list_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(color: Colors.red.withOpacity(.7)),
              child: Image.asset(
                "assets/images/logo.webp",
                width: 115,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  CustomDrawerListTile(
                    newFrameIndex: 0,
                    icon: Icons.home,
                    title: "Home",
                    isSelected: currentFrameIndex == 0,
                  ),
                  const Divider(),
                  CustomDrawerListTile(
                    newFrameIndex: 1,
                    icon: Icons.favorite,
                    title: "Favorite",
                    isSelected: currentFrameIndex == 1,
                  ),
                  const Divider(),
                  CustomDrawerListTile(
                    newFrameIndex: 2,
                    icon: Icons.my_library_add_rounded,
                    title: "Library",
                    isSelected: currentFrameIndex == 2,
                  ),
                  const Divider(),
                  CustomDrawerListTile(
                    newFrameIndex: 3,
                    icon: Icons.person,
                    title: "Person",
                    isSelected: currentFrameIndex == 3,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(color: Colors.grey),
                          children: [
                            const TextSpan(text: "Idealizado por "),
                            TextSpan(
                              text: "Ruben Manuel",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(text: "."),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
