import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeTile extends StatelessWidget {

  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;
  String? coffeeAdditive;
  // final String coffeeTopping;
  final VoidCallback onTap;

  CoffeeTile({
    required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeePrice,
    required this.onTap,
    this.coffeeAdditive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
        child: Container(
          padding: EdgeInsets.all(12),
          width: 200,
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.black,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      coffeeImagePath,
                      width: 200,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  ),
                //),

                // coffee name
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coffeeName,
                        // style: TextStyle(fontSize: 20),
                        style: GoogleFonts.montserrat(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text(coffeeAdditive!,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),

                // price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$' + coffeePrice),
                      Container(
                        // padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Icon(Icons.add)
                      )
                    ],
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
