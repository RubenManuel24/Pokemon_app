import 'package:flutter/material.dart';
import 'package:pokemon_app/global-functions-and-variables/global_variables.dart';
import 'package:pokemon_app/screens/main-frames/favorite_frame.dart';
import 'package:pokemon_app/screens/main-frames/home_frame.dart';
import 'package:pokemon_app/screens/main-frames/library_frame.dart';
import 'package:pokemon_app/screens/main-frames/person_frame.dart';

class MainFramesPage extends StatefulWidget {
  const MainFramesPage({super.key});

  @override
  State<MainFramesPage> createState() => _MainFramesPageState();
}

class _MainFramesPageState extends State<MainFramesPage> {
  @override
  Widget build(BuildContext context) {
    void handlePageChange(int pageIndex) {
      mainFramesPageFramesController.animateToPage(pageIndex,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      setState(() {
        currentFrameIndex = pageIndex;
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
          ),
        ),
        title: Image.asset(
          "assets/images/logo.webp",
          width: 115,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/boll2.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.5),
            ),
          ),
          PageView(
            controller: mainFramesPageFramesController,
            onPageChanged: (pageIndex) => handlePageChange(pageIndex),
            children: const [
              HomeFrame(),
              FavoriteFrame(),
              LibraryFrame(),
              PersonFrame()
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentFrameIndex,
        showUnselectedLabels: false,
        onTap: (pageIndex) => handlePageChange(pageIndex),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_add_rounded), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
        ],
      ),
    );
  }
}