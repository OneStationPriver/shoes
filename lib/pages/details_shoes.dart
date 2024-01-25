import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/shoes.dart';
import 'package:flutter_application_2/widgets/custom_button.dart';
import 'package:flutter_application_2/widgets/transition.dart';

class DetailsShoesPage extends StatefulWidget {
  final Shoes shoes;
  const DetailsShoesPage({super.key, required this.shoes});

  //get shoes => null;

  @override
  State<DetailsShoesPage> createState() => _DetailsShoesPageState();
}

class _DetailsShoesPageState extends State<DetailsShoesPage> {
int valueIndexColor = 0;
int valueIndexSize = 1;

double sizeShoes(int index, Size size) {
  switch(index){
    case 0:
    return (size.height * 0.09);
    case 1:
    return (size.height * 0.07);
    case 2:
    return (size.height * 0.05);
    case 3:
    return (size.height * 0.04);
    default:
    return (size.height * 0.05);
  }
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -size.height * 0.15,
            right: -size.height * 0.20,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 250),
              tween: Tween(begin: 0, end: 1),
              builder: (context, value, __) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: value * (size.height * 0.5),
                  width: value * (size.height * 0.5),
                  decoration: BoxDecoration(
                    color: widget.shoes.listImage[valueIndexColor].color,
                    shape: BoxShape.circle,
                  ),
                );
              }
            ),
          ),
          Positioned(
            top: kToolbarHeight, //
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onTap: () => Navigator.pop(
                      context), // se utiliza para establecer la altura de la parte superior de un widget en el valor de la constante.
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.20,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: FittedBox(
                child: Text(
                  widget.shoes.category,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[100],
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250), // aqui se modifica el tamano de los zapatos al presionar en lass tallas.
            top: size.height * 0.22,
            right: sizeShoes(valueIndexSize, size),
            left: sizeShoes(valueIndexSize, size),
            child: Hero(
              // Animaciones estilo Heroe.
              tag: widget.shoes.name,
              child: Image(
                image: AssetImage(
                  widget.shoes.listImage[valueIndexColor].image,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.6,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // con el ShakeTransition damos animacion con efecto de sacudida al entrar en esta ventana a los objetos dentro de este ShakeTransition.
                    ShakeTransition(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aqui movemos la palabra "NIKE AIR" para la izquierda.
                        children: [
                          Text(
                            widget.shoes.category,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.shoes.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ShakeTransition(
                      left:
                          false, // le desimos que el efecto lo lance por la derecha.
                      child: Text(
                        widget.shoes.price,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: widget.shoes.punctuation > index
                                ? widget.shoes.listImage[valueIndexColor].color
                                : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "SIZE",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(
                          4,
                          (index) => Padding(
                            padding: const EdgeInsets.only(
                                right:
                                    16.0), // se le da el espacio entre los botones.
                            child: CustomButton(
                              onTap: () {
                                valueIndexSize = index;
                                setState(() {
                                  
                                });
                              },
                              color: index == valueIndexSize
                                  ? widget.shoes.listImage[valueIndexColor].color
                                  : Colors.white,
                              child: Text(
                                "${index + 7}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color:
                                      index == valueIndexSize ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.84,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end, // eje horizontal.
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // eje vertical.
              children: [
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "COLOR",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(
                          widget.shoes.listImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              valueIndexColor = index; // con el setState actualiza el estado de los widgets.
                              setState(() {
                                
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      8), // se le da un margen de separacion a los circulos de colores hacia la derecha.
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: widget.shoes.listImage[index].color,
                                shape: BoxShape.circle,
                                border: index == valueIndexColor
                                    ? Border.all(color: Colors.white, width: 2)
                                    : null, // con esta linea se le da un border de color blanco al primer circulor.
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ShakeTransition(
                  left: false,
                  child: CustomButton(
                    onTap: (){},
                    width: 100,
                    color: widget.shoes.listImage[valueIndexColor].color,
                    child: const Text(
                      "BUY",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
