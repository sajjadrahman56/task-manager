import 'package:flutter/material.dart';

List<int> quantity = [1, 1, 1];
int amount = 0;
ValueNotifier<int> amountNotifier = ValueNotifier<int>(0);

class Product {
  final String itemName;
  final String itemColor;
  final String itemSize;
  final int price;

  Product(this.itemName, this.itemColor, this.itemSize, {this.price = 0});
}

class BaseProductScreen extends StatefulWidget {
  const BaseProductScreen({super.key});

  @override
  State<BaseProductScreen> createState() => _BaseProductScreenState();
}

class _BaseProductScreenState extends State<BaseProductScreen> {
  int total = 0;
  final List<Product> products = [
    Product('T-Shirt', 'Black', 'L', price: 100),
    Product('Jeans', 'Gray', 'M', price: 65),
    Product('Shoes', 'White', 'XL', price: 45),
  ];

  @override
  void initState() {
    super.initState();
  }

  int calculateTotalPrice() {
    for (int i = 0; i < products.length; i++) {
      total += products[i].price * quantity[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [Icon(Icons.search), SizedBox(width: 10)],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "My Bag",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return buildProductCard(products[index], context, index);
                },
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amount : ',
                                style: textStyle(16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: ValueListenableBuilder<int>(
                                  valueListenable: amountNotifier,
                                  builder: (BuildContext context, int value,
                                      Widget? child) {
                                    int total = 0;
                                    for (int i = 0; i < products.length; i++) {
                                      total += products[i].price * quantity[i];
                                    }
                                    return Text(
                                      '\$ ${total}',
                                      style: textStyle(
                                        20,
                                      ),
                                    );
                                  },
                                ),
                              )
                            ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Congratulations!'),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          child: Center(
                              child: Text(
                            'CHECK OUT',
                            style: textStyle(23, color: Colors.white),
                          )),
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )),
          ],
        ));
  }

  Widget buildProductCard(Product product, BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          children: [
            _container1(context),
            _bodyTextWidget(
                product.itemName, product.itemColor, product.itemSize, index),
            priceIconPortion(product.price),
          ],
        ),
      ),
    );
  }

  int i = 1;

  Widget _container1(context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.25;
    double containerHeight = containerWidth * 1;

    String imagePath = 'images/$i.jpg';

    i = (i % 3) + 1;

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        image: DecorationImage(
          image: AssetImage(imagePath), // Path to your asset image
          fit: BoxFit
              .cover, // Use BoxFit.cover to make the image fit the container
        ),
      ),
    );
  }

  Widget _bodyTextWidget(
      String itemName, String itemColor, String itemSize, int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(itemName, style: textStyle(20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(
              children: [
                Row(
                  children: [
                    const Text('Color: '),
                    Text(itemColor,
                        style: textStyle(14, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                  ],
                ),
                Row(
                  children: [
                    const Text('Size: '),
                    Text(itemSize,
                        style: textStyle(14, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            incremetDecreButton(
              index: index,
              products: products,
            ),
          ],
        ),
      ),
    );
  }

  Widget priceIconPortion(int price) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "\$ $price",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget incremetDecreButton(
      {required int index, required List<Product> products}) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              setState(() {
                if (quantity[index] > 1) {
                  quantity[index]--;
                  amountNotifier.value = calculateTotalPrice();
                }
              });
            },
            child: iconContainer(const Icon(Icons.remove))),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Text(
          '${quantity[index]}',
          style: textStyle(18, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        InkWell(
            onTap: () {
              setState(() {
                quantity[index]++;
                amountNotifier.value = calculateTotalPrice();
              });
            },
            child: iconContainer(const Icon(Icons.add))),
      ],
    );
  }

  TextStyle textStyle(double size, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: size,
      color: color ?? Colors.black,
    );
  }

  Widget iconContainer(child) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
