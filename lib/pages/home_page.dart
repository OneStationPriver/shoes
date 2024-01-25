import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/models/data.dart';
import 'package:flutter_application_2/models/shoes.dart';
import 'package:flutter_application_2/pages/details_shoes.dart';
// import 'package:flutter_application_2/models/shoes.dart';
import 'package:flutter_application_2/widgets/custom_app_bar.dart';
import 'package:flutter_application_2/widgets/custom_button_bar.dart';

class HomePageShoes extends StatefulWidget {
  const HomePageShoes({super.key});

  @override
  State<HomePageShoes> createState() => _HomePageShoesState();
}

class _HomePageShoesState extends State<HomePageShoes> {
  final _pageController = PageController(viewportFraction: 0.75);

  double _currentPage = 0.0;
  double indexPage = 0.0;

// con esta funcion se actualizara cunado ocurra un cambio que deberia generar una actualizacion.
// con el setState le decimos que el estado del widget a cambiado.
  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
      if (_currentPage >= 0 && _currentPage < 0.7) {
        indexPage = 0;
      } else if (_currentPage > 0.7 && _currentPage < 1.7) {
        indexPage = 1;
      } else if (_currentPage > 1.7 && _currentPage < 2.7) {
        indexPage = 2;
      }
    });
  }

  Color getColor() {
    late final Color color;
    //_currentPage = _pageController.page!;
    if (_currentPage >= 0 && _currentPage < 0.7) {
      color = listShoes[0].listImage[0].color;
    } else if (_currentPage > 0.7 && _currentPage < 1.7) {
      color = listShoes[1].listImage[0].color;
    } else if (_currentPage > 1.7 && _currentPage < 2.7) {
      color = listShoes[2].listImage[0].color;
    }

    return color;
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_listener);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
//-------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: List.generate(
                  listCategory.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      listCategory[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: index == 0 ? getColor() : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Dentro de este Expanded esta todo lo que va dentro del cuadro blanco osea es los cudros blancos.
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listShoes.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                final shoes = listShoes[index];
                final ListTile = shoes.category.split(' ');
                // La opción de GestureDetector en Flutter se define como un widget que se hace cargo de la detección de los gestos del usuario en la aplicación.
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, _) {
                          return DetailsShoesPage(shoes: shoes);
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: index == indexPage
                            ? 30
                            : 60), // Esto da la separacion entre los cuadros blancos de los zapatos.
                    child: Transform.translate(
                      offset: Offset(index == indexPage ? 0 : 20, 0),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: EdgeInsets.only(
                            top: index == indexPage ? 30 : 50,
                            bottom: 30,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            color: Colors.white,
                          ),
                          child: Stack(
                            // Stack. Permite 'colocar' widgets uno encima de otro, produciendo un solape.
                            clipBehavior: Clip
                                .none, // Esto hace que la imagen de los zapatos este por encima de las cajas blancas dando un efecto.
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 40),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      shoes.category,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      shoes.name,
                                      style: const TextStyle(
                                          fontSize: 28,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      shoes.price,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 4),
                                    FittedBox(
                                      child: Text(
                                        '${ListTile[0]} \n ${ListTile[1]}',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: constraints.maxHeight * 0.2,
                                  left: constraints.maxWidth * 0.05,
                                  right: constraints.maxWidth * 0.16,
                                  bottom: constraints.maxHeight * 0.2,
                                  child: Hero(
                                    tag: shoes.name,
                                    child: Image(
                                      image: AssetImage(shoes.listImage[0].image),
                                    ),
                                  )),
                              Positioned(
                                bottom:
                                    0, // muebe el cuadro con el (+) hacia abajo.
                                right:
                                    0, // muebe el cuadro con el (+) hacia la derecha.
                                child: Material(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(36),
                                    bottomRight: Radius.circular(36),
                                  ),
                                  clipBehavior: Clip
                                      .antiAliasWithSaveLayer, // al pulsar sobre el boton se marca una expecie de sombra por defecto con esto lo quitamos o reducimos a el boton.
                                  color: shoes.listImage[0].color,
                                  child: InkWell(
                                    onTap: () {},
                                    child: const SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
          ),

          // Este contenedor es la parte amarilla de abajo que controla cosas en la app.
          Container(
            height: 100,
            padding: EdgeInsets.all(20),
            child: CustomButtonBar(
              color: getColor(),
            ),
          )
        ],
      ),
    );
  }
}