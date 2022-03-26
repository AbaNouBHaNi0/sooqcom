import 'package:fireapp/app/constants.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../screens/details_screen.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key? key,
    required this.itemIndex,
    required this.product,
    required this.press,
  });

  final int itemIndex;
  final Product product;
  final Function press;

  @override
  State<ProductCard> createState() =>
      _ProductCardState(itemIndex: itemIndex, press: press, product: product);
}

class _ProductCardState extends State<ProductCard> {
  _ProductCardState({
    Key? key,
    required this.itemIndex,
    required this.product,
    required this.press,
  });

  final int itemIndex;
  final Product product;
  final Function press;

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              ///صورة المنتج
              InkWell(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: product)));
                }),
                child: Container(
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              ///تفاصيل المنتج
              SizedBox(
                height: 136.0,
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0 * 1.5, // 30 px padding
                          vertical: 20.0 / 5, // 5 px padding
                        ),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Text('price: \$${widget.product.price}'),
                      ),
                    ),
                  ],
                ),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// import '../../constants.dart';
// import '../../models/product.dart';

// class ProductCard extends StatefulWidget {
//   const ProductCard({
//     Key? key,
//     required this.itemIndex,
//     required this.product,
//     required this.press,
//   }) : super(key: key);

//   final int itemIndex;
//   final Product product;
//   final Function press;

//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return 
//     Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: 20.0,
//         vertical: 10,
//       ),
//       height: 190.0,
//       child: InkWell(
//         onTap: widget.press(),
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Container(
//               height: 166.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(22),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       offset: Offset(0, 15),
//                       blurRadius: 25,
//                       color: Colors.black12),
//                 ],
//               ),
//             ),

//             ///صورة المنتج
//             Container(
//               child: Image.asset(
//                 widget.product.image,
//                 fit: BoxFit.cover,
//               ),
//             ),

//             ///تفاصيل المنتج
//             SizedBox(
//               height: 136.0,
//               width: size.width - 200,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 20.0 * 1.5, // 30 px padding
//                         vertical: 20.0 / 5, // 5 px padding
//                       ),
//                       decoration: BoxDecoration(
//                         color: kSecondaryColor,
//                         borderRadius: BorderRadius.circular(22),
//                       ),
//                       child: Text('price: \$${widget.product.price}'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
