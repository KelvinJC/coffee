import 'package:coffee_app/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_app/util/coffee_tile.dart';
import 'package:coffee_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // route attribute
  static const String routeName = '/';
  // route method
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => HomePage()
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // list of coffee types
  final List coffeeType = [
    // [ coffee type, isSelected ]
    [
      'Cappuccino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];


  final List coffeeTile = [
    [
      'lib/images/latte.jpg',
      'Latte',
      '4.50'
    ],
    [
      'lib/images/cappucino.jpg',
      'Cappuccino',
      '5.20'
    ],
    [
      'lib/images/milk.jpg',
      'Black',
      '4.00'
    ],
  ];

  List<Coffee> coffeeDetail = [
    Coffee(
        name: 'Latte',
        additive: 'With Almond Milk',
        image: 'lib/images/latte.jpg',
        description: 'A froth filled coffee drink with milk and sugar added ...',
        price: '4.50'
    ),
    Coffee(
        name: 'Cappuccino',
        additive: 'With Oat Milk',
        image: 'lib/images/cappucino.jpg',
        description: 'A cappuccino is a coffee-based drink made primarily from espresso and milk ...',
        price: '5.20'
    ),
    Coffee(
        name: 'Black',
        additive: 'No sugar or cream',
        image: 'lib/images/milk.jpg',
        description: 'A black is a coffee drink without any milk or sugar added ...',
        price: '4.00'
    ),
  ];

  // user tapped on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      // alternative to for loop -- use a map fxn
      // coffeeType.map((type) => type[1] = false);
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home, color: Colors.orange),
              label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search, color:Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart, color:Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite, color:Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications, color:Colors.grey),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Find the best coffee for you
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's find \n"
                      "the best coffee",
                      // "for you",
                      style: GoogleFonts.montserrat(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("for you",
                      style: GoogleFonts.montserrat(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[400],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0,),

              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Find your coffee',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),

              // Horizontal listview of coffee types,
              Container(
                height: 50,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 3.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      }
                    );
                  }
                ),
              ),

              // Horizontal listview of coffee tiles
              SizedBox(
                height: 300,
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: coffeeTile.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: CoffeeTile(
                            coffeeName: coffeeDetail[index].name,
                            coffeePrice: coffeeDetail[index].price,
                            coffeeImagePath: coffeeDetail[index].image!,
                            coffeeAdditive: coffeeDetail[index].additive,
                            // isSelected: coffeeType[index][1],
                            onTap: () {
                              Navigator.pushNamed(context, '/coffee_detail', arguments: coffeeDetail[index]);
                            },
                          ),
                        );
                      }
                  ),
              ),
              // Container(
              //   child: Text(
              //       'Popular',
              //       style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.orange
              //       ),
              //       textAlign: TextAlign.left,
              //     ),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 280.0, 0.0),
                child: Text(
                  'Popular',
                  style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeTile.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: CoffeeTile(
                          coffeeName: coffeeTile[2][1],
                          coffeePrice: coffeeDetail[index].price,
                          coffeeImagePath: coffeeTile[2][0],
                          coffeeAdditive: coffeeDetail[index].additive,
                          // isSelected: coffeeType[index][1],
                          onTap: () {
                            Navigator.pushNamed(context, '/coffee_detail', arguments: coffeeDetail[index] );
                          },
                        ),
                      );
                    }
                ),
              ),
              MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: Colors.orange,
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
