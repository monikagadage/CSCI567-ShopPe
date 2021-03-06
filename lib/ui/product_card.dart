import 'package:flutter/material.dart';
import 'product_details_screen.dart';
import 'package:signup/reusable_widgets/reusable_widgets.dart';

// class TitleText extends StatelessWidget {
//   final String text;
//   final double fontSize;
//   final Color color = Color(0xff1d2635);
//   final FontWeight fontWeight;
//   TitleText(
//       {Key? key,
//         required this.text,
//         this.fontSize = 18,
//         // this.color = Color(0xff1d2635),
//         this.fontWeight = FontWeight.w800})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Text(text,
//         style: GoogleFonts.mulish(
//             fontSize: fontSize, fontWeight: fontWeight, color: color));
//   }
// }


// class Product{
//   int id;
//   String name ;
//   String category ;
//   String image ;
//   double price ;
//   bool isliked ;
//   bool isSelected ;
//   Product({this.id,this.name, this.category, this.price, this.isliked,this.isSelected = false,this.image});
// }

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  // final ValueChanged<Product> onSelected;
  ProductCard({Key? key, required this.product}) : super(key: key);

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   Product product;
//   @override
//   void initState() {
//     product = widget.product;
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      // margin: EdgeInsets.symmetric(vertical: !product.isSelected ? 20 : 0),
      child: GestureDetector(
          onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
        builder: (_) => ProductDetails(product))),
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Positioned(
            //   left: 0,
            //   top: 0,
            //   child: IconButton(
            //     icon: Icon(
            //       product.isliked ? Icons.favorite : Icons.favorite_border,
            //       color:
            //           product.isliked ? Color(0xffF72804) : Color(0xffa8a09b),
            //     ),
            //     onPressed: () {},
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // SizedBox(height: product.isSelected ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xffE65829).withAlpha(40),
                      ),
                      Image.network(product["product-img"])
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                TitleText(
                  text: product["product-name"],
                  // fontSize: product.isSelected ? 16 : 14,
                  fontSize: 16,
                ),
                // TitleText(
                //   text: product.category,
                //   fontSize: product.isSelected ? 14 : 12,
                //   color: Color(0xffE65829),
                // ),
                TitleText(
                  text: product["product-price"].toString(),
                  // fontSize: product.isSelected ? 18 : 16,
                    fontSize: 16,
                ),
              ],
            ),
          ],
        ),
      )
      //     .ripple(() {
      //   Navigator.of(context).pushNamed('/detail');
      //   // onSelected(product);
      // }, borderRadius: BorderRadius.all(Radius.circular(20))),
    ),
    );
  }
}
