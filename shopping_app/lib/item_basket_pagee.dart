import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/models/product.dart';

class ItemBasketPagee extends StatefulWidget {
  const ItemBasketPagee({super.key});

  @override
  State<ItemBasketPagee> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemBasketPagee> {
  List<Product> basketList = [
    Product(
        productNo: 1,
        productName: "노트북(Laptop)",
        productImageUrl: "https://picsum.photos/id/1/300/300",
        price: 600000),
    Product(
        productNo: 4,
        productName: "키보드(Keyboard)",
        productImageUrl: "https://picsum.photos/id/60/300/300",
        price: 50000),
  ];

  List<Map<int, int>> quantity = [
    {1: 2},
    {4: 3}
  ];

  double _totalPrice = 0; //장바구니에 넣은 물품의 총 가격

  @override
  void initState() {
    //맨 처음 가격에 대한 초기화를 해준다.
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < basketList.length; i++) {
      _totalPrice =
          basketList[i].price! + quantity[i][basketList[i].productNo]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("제품 장바구니 페이지"),
        centerTitle: true,
      ),
      body: Container(),
    );
  }

  Widget BasketContainer({

  });
}
