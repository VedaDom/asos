import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.separated(
        itemCount: 12,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Image.network(
                "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
                width: 130,
                height: 100,
              ),
              SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Khdkjfh dsjfjf"),
                  SizedBox(height: 8),
                  Text("Quantity: 3"),
                  SizedBox(height: 8),
                  Text(
                    "\$ 852",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16);
        },
      ),
    );
  }
}
