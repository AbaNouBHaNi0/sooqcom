import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/details/details_body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF219ebc),
      appBar: detailsAppBar(context),
      body: DetailsBody(
        product: product,
      ),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF1EFF1),
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(right: 20),
        icon: Icon(
          Icons.arrow_back,
          color: Color(0xFF219ebc),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'back',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
