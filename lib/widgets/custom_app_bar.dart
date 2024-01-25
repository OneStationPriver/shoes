import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
                "https://jobs.nike.com/media/images/logo-nike-WHT.original.png", width: 100,),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag_outlined),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
