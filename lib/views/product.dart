import 'package:asos/models/product_detail.dart';
import 'package:asos/services/api.dart';
import 'package:asos/views/cart.dart';
import 'package:asos/widgets/product_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final int productId;
  const ProductView({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int selectedIndex = 0;
  int selectedSizeIndex = 0;

  ApiService _apiService = ApiService();
  late ProductDetailModel product;
  bool isLoading = true;

  @override
  void initState() {
    _apiService.getProductDetails(widget.productId)!.then((value) {
      product = value;
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(height: 400),
                        items: product.media!.images!.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Image.network(
                                "https://${i.url}",
                                fit: BoxFit.fill,
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Positioned(
                        top: 40,
                        left: 0,
                        child: BackButton(),
                      )
                    ],
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Item \n kjkjkjk kjjkjk",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      itemCount: 12,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSizeIndex = index;
                            });
                          },
                          child: Chip(
                            label: Text("\$ 58"),
                            avatar: Container(
                              child: Center(
                                child: Text(
                                  "XL",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedSizeIndex == index
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 8,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return CartView();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "ADD TO CART",
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Similar items",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ProductsList(
                      products: [],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
