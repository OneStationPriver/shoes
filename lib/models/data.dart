import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/shoes.dart';

final listCategory = ["Basketball", "Running", "Traning"];
final listShoes = [
  Shoes(
    'AIR JORDAN I MI SE GC',
    'NIKE AIR',
    '\$120.00',
    4,
    [
      ImageShoes(
        'assets/shoes/imagen1.webp',
        const Color(0xffEAA906),
      ),
      ImageShoes(
        'assets/shoes/imagen1.webp',
        const Color(0xff08B894),
      ),
      ImageShoes(
        'assets/shoes/imagen1.webp',
        const Color(0xffB50D0D),
      ),
      ImageShoes(
        'assets/shoes/imagen1.webp',
        const Color(0xff229954),
      ),
    ],
  ),
  Shoes(
    'NIKE BLAZER MID',
    'NIKE AIR',
    '\$150.00',
    3,
    [
      ImageShoes(
        'assets/shoes/imagen2.png',
        const Color(0xff80B894),
      ),
      ImageShoes(
        'assets/shoes/imagen2.png',
        const Color(0xffE90311),
      ),
      ImageShoes(
        'assets/shoes/imagen2.png',
        const Color(0xff189E03),
      ),
      ImageShoes(
        'assets/shoes/imagen2.png',
        const Color(0xffF76A02),
      ),
    ],
  ),
  Shoes(
    'ZOONX VAPORFLY',
    'NIKE ZOOM',
    '\$180.00',
    2,
    [
      ImageShoes(
        'assets/shoes/imagen3.png',
        const Color(0xff7B7A41),
      ),
      ImageShoes(
        'assets/shoes/imagen3.png',
        const Color(0xff2C2C46),
      ),
      ImageShoes(
        'assets/shoes/imagen3.png',
        const Color(0xff262626),
      ),
      ImageShoes(
        'assets/shoes/imagen3.png',
        const Color(0xff5C9462),
      ),
    ],
  ),

];

