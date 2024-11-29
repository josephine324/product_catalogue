// lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set initial theme to light
  bool isDarkMode = false;

  // List of products
  final List<Product> products = [
    Product(
      name: "Laptop",
      imageUrl:
          "https://images.unsplash.com/photo-1484788984921-03950022c9ef?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGFwdG9wfGVufDB8fDB8fHww",
      price: 999.99,
    ),
    Product(
      name: "Phone",
      imageUrl:
          "https://images.unsplash.com/photo-1509395176047-4a66953fd231?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cGhvbmV8ZW58MHx8MHx8fDA%3D",
      price: 799.99,
    ),
    Product(
      name: "Headphones",
      imageUrl:
          "https://media.istockphoto.com/id/1479725750/photo/headphones-isolated-on-a-white-background-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=Aav_e2xyf_sSZvNiOaLrBJB-hyOy1kgHN6ROanfGgKM=",
      price: 199.99,
    ),
    Product(
      name: "Watch",
      imageUrl:
          "https://images.unsplash.com/photo-1601924357840-3e50ad4dd9fd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8d2F0Y2h8ZW58MHx8MHx8fDA%3D",
      price: 149.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Store',
      theme: isDarkMode ? MyThemes.dark : MyThemes.light,
      home: CatalogPage(
        toggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        products: products,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CatalogPage extends StatelessWidget {
  final Function toggleTheme;
  final List<Product> products;

  CatalogPage({required this.toggleTheme, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronic Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              toggleTheme();
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              // Show a dialog with the product name
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(product.name),
                  content: Text('Price: \$${product.price}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('\$${product.price}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
