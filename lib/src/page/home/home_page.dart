import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:pokemon_app/src/page/home/home_controller.dart';
import 'package:signals_flutter/signals_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Injector.get<HomeController>();

  @override
  void initState() {
    controller.getAllPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.webp",
          width: 115,
        ),
        backgroundColor: const Color.fromARGB(255, 156, 13, 3),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
              weight: 5,
            )),
      ),
      body: Watch((_) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/boll2.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.5)),
          child: controller.loadibg
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Expanded(
                    child: GridView.builder(
                        itemCount: controller.pokemonInfor.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          final result = controller.pokemonInfor[index];

                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/detalhe',
                                  arguments: result);
                            },
                            child: Card(
                              color: controller.colorCardPokemon(result!.type),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      result.name,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(height: 3),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(4),
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.transparent
                                              .withOpacity(0.1)),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        result.type,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Image.network(
                                          result.image,
                                          width: 200,
                                          height: 200,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 156, 13, 3),
          items: const [
            BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home_rounded)),
            BottomNavigationBarItem(
                label: "Favorite", icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                label: "Library", icon: Icon(Icons.my_library_add_rounded)),
            BottomNavigationBarItem(label: "Person", icon: Icon(Icons.person))
          ]),
    );
  }
}
