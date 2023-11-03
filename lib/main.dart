import 'package:flutter/material.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.green[200],),
            color: Colors.black,
            titleTextStyle: TextStyle(
                color: Colors.green[200], fontWeight: FontWeight.bold, fontSize: 25),
            centerTitle: true,
            elevation: 0,
          ),
      ),
      home: ProductPage(),
    );
  }
}




class ProductPage extends StatefulWidget {
  const ProductPage({super.key,});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.green[200],
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            )),
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.black.withOpacity(0.8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    color: Colors.transparent,
                    height: 400,
                    width: 400,
                    child: Card(
                        elevation: 20,
                        color: Colors.green.withOpacity(.3),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Beetroot.png')
                                  )
                              ),
                            ),
                            Positioned(
                                top: 5,
                                bottom: 360,
                                left: 5,
                                right: 290,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(radius: 10,backgroundColor: Colors.green[200]),
                                )
                            ),
                          ],
                        )


                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                 'Beetroot',
                  style: TextStyle(color: Colors.green[200], fontSize: 40),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    '1 Kg of fresh and good quality Beetroots'),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Price',
                            style: TextStyle(fontSize: 25),
                            children: [
                              TextSpan(text: ' : '),
                              TextSpan(text: '₹ '),
                              TextSpan(
                                  text: '30',
                                  style: TextStyle(color: Colors.green[200])),
                            ])),
                    CartStepperInt(
                      value: _counter,
                      size: 35,
                      style:CartStepperStyle(
                        activeBackgroundColor: Colors.white.withOpacity(.2),
                        activeForegroundColor: Colors.white,
                        border: Border.all(color: Colors.white),
                        buttonAspectRatio: 1.5,
                      ),
                      didChangeCount: (count) {
                        setState(() {
                          _counter=count;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: AnimatedButton(height: 50,
                    width: 350,
                    text: 'Add To Cart',
                    isReverse: true,
                    selectedTextColor: Colors.white,
                    selectedBackgroundColor: Colors.green,
                    transitionType: TransitionType.TOP_CENTER_ROUNDER,
                    textStyle: TextStyle(color: Colors.white, fontSize: 20),
                    backgroundColor: Colors.white.withOpacity(.2),
                    borderColor: Colors.white,
                    borderRadius: 50,
                    borderWidth: 1,
                    onPress: (){},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
