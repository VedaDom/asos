import 'package:asos/models/product.dart';
import 'package:asos/views/product.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  final List<ProductModel>? products;
  const ProductsList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products!.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return ProductView(
                  productId: products![index].id!,
                );
              }),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                "https://${products![index].imageUrl!}",
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                products![index].price!.current!.text!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                products![index].name!,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
