import 'package:flutter/material.dart';

import 'package:shopping_api/Model/product_model.dart';
import 'package:shopping_api/Views/whatsappa_chat.dart';

class ProductDetails extends StatefulWidget {
  final Product porduct;
  const ProductDetails({
    required this.porduct,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  //whatsapp function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Card(
                elevation: 0,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Image.network(
                      widget.porduct.imageLink,
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    '\$${widget.porduct.price}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      widget.porduct.description,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WhatsAppChatScreen(),
                ]))));
  }
}
