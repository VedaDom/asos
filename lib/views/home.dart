import 'package:asos/models/category.dart';
import 'package:asos/models/product.dart';
import 'package:asos/services/api.dart';
import 'package:asos/views/cart.dart';
import 'package:asos/views/orders.dart';
import 'package:asos/widgets/product_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<bool> isSelected = [true, false];
  bool isLoading = false;
  int selectedCategoryIndex = 0;
  List<CategoryModel> categories = maleCategoies;
  ApiService _apiService = ApiService();
  List<ProductModel> products = [];

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  void getProducts() async {
    setState(() {
      isLoading = true;
    });
    products = (await _apiService.getProducts(
      categories[selectedCategoryIndex].id,
    ))!;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 32, bottom: 32),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleButtons(
                      borderRadius: BorderRadius.circular(8),
                      children: [
                        SizedBox(
                          width: 80,
                          child: Center(child: Text("Male")),
                        ),
                        SizedBox(
                          width: 80,
                          child: Center(child: Text("Female")),
                        ),
                      ],
                      isSelected: isSelected,
                      onPressed: (int index) {
                        setState(() {
                          selectedCategoryIndex = 0;
                          if (index == 0) {
                            categories = maleCategoies;
                          } else {
                            categories = womenCategoies;
                          }
                          for (int buttonIndex = 0;
                              buttonIndex < isSelected.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              isSelected[buttonIndex] = true;
                            } else {
                              isSelected[buttonIndex] = false;
                            }
                          }
                        });
                        getProducts();
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => ProfileView(),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Icon(
                            Icons.person_outline_outlined,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_outlined,
                      color: Colors.black38,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Search everything",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 16, right: 16),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                      // get new list of product for a selected category
                      getProducts();
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(categories[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          categories[index].title,
                          style: TextStyle(
                            fontSize: selectedCategoryIndex == index ? 18 : 16,
                            color: selectedCategoryIndex == index
                                ? Theme.of(context).primaryColor
                                : Colors.black38,
                          ),
                        ),
                      ],
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
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ProductsList(
                      products: products,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                right: 16,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: Icon(
                        Icons.person_outline_outlined,
                        size: 30,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nsengimana Veda Dominique",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "nsengimanavedadom@gmail.com",
                          style: TextStyle(fontSize: 10),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text("My Cart"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return CartView();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shop_2_outlined),
              title: Text("Orders"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return OrdersView();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_outline),
              title: Text("Favorite"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text("Logout"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
