import '/models/models.dart';
import 'package:flutter/material.dart';

class CoffeeDetailScreen extends StatelessWidget {
  
  // route attribute
  static const String routeName = '/coffee_detail';
  // route method
  static Route route(Coffee coffee) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => CoffeeDetailScreen(coffee: coffee)
    );
  }

  final Coffee coffee;

  const CoffeeDetailScreen({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
        child: SafeArea(
          child: Column(
            children: [
              // Photo & Product Details
              Container(
                height: 425,
                width: 450,
                child : ClipRRect( //to clip overflown positioned containers.
                  borderRadius: BorderRadius.circular(30),
                  //if we set border radius on container, the overflown content get displayed at corner.
                  child:Container(

                      child: Stack(
                        // alignment: Alignment.center,
                        children: <Widget>[ //Stack helps to overlap widgets
                          Positioned( //positioned helps to position widget wherever we want.
                            // top:-20, left:-50, //position of the widget
                            child: Image.asset(
                              coffee.image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top:250,
                            left: 0,
                            right: 0,
                            child:Container(
                                height:150,
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  shape:BoxShape.rectangle,
                                  color:Colors.brown[800]?.withOpacity(0.9),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              coffee.name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              )
                                          ),
                                          SizedBox(height: 5,),
                                          Text(
                                              coffee.additive!,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[500]
                                              )
                                          ),
                                          SizedBox(height: 25,),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent[200],
                                              ),
                                              SizedBox(width: 5,),
                                              Text(
                                                '${coffee.rating}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              Text(
                                                '${coffee.aggregate_score}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey[500]
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),


                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height:60,
                                                width: 65,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  color: Colors.black,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.sports_football_outlined,
                                                      color: Colors.orangeAccent[200],
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      'Coffee',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey[500]
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Container(
                                                height:60,
                                                width: 65,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  color: Colors.black,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.water_drop,
                                                      color: Colors.orangeAccent[200],
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      'Milk',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey[500]
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            height:40,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${coffee.roast_level}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),

                          Positioned(  //main content container postition.
                            child: Container(
                                height: 80,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[900],
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[900],
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ),
              // Description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.grey,
                        ),

                      ),
                      SizedBox(height: 10,),
                      Text(
                        '${coffee.description}',
                      ),
                      SizedBox(height: 5,),
                      Text(
                          'Read More',
                          style: TextStyle(
                              color: Colors.orangeAccent[200]
                          )
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),

              // Size selection
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.black,
                  // ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Size',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {

                              },
                              style: TextButton.styleFrom(
                                  side: BorderSide(color: Colors.orangeAccent),
                                  backgroundColor: Colors.grey[900]
                              ),
                              child: Text('S'),
                            ),
                            TextButton(
                              onPressed: () {
                                style: TextButton.styleFrom(
                                    side: BorderSide(color: Colors.orangeAccent),
                                    backgroundColor: Colors.grey[900]
                                );
                              },
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.grey,
                                  backgroundColor: Colors.black
                              ),
                              child: Text('M'),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.grey,
                                  backgroundColor: Colors.black
                              ),
                              child: Text('L'),
                            ),
                          ],
                        )
                      ],
                    )
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                        Text(
                          '\$' + coffee.price,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )

                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            fixedSize: const Size(250, 50),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orangeAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
