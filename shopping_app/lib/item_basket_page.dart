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
      _totalPrice +=
          basketList[i].price! * quantity[i][basketList[i].productNo]!;
    }
    print(_totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("제품 장바구니 페이지"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: basketList.length,
        itemBuilder: (context, index) {
          return BasketContainer(
              productNo: basketList[index].productNo!,
              productName: basketList[index].productName!,
              productImageUrl: basketList[index].productImageUrl!,
              price: basketList[index].price!,
              quantity: quantity[index][basketList[index].productNo]!);
        },
      ),
      //결제하기 버튼
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
            onPressed: () {},
            child: Text("총 ${numberFormat.format(_totalPrice)}원 결제하기")),
      ),
    );
  }

//UI
  Widget BasketContainer(
      {required int productNo,
      required String productName,
      required String productImageUrl,
      required double price,
      required int quantity}) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: productImageUrl,
            width: MediaQuery.of(context).size.width * 0.3,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2), //로딩중일 때 원의 지름
              );
            },
            errorWidget: (context, url, error) {
              return const Center(
                child: Text("오류 발생"),
              );
            },
          ),
          Container(
            //장바구니에 넣은 상품의 이름, 가격
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  productName,
                  textScaler: const TextScaler.linear(1.2),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${numberFormat.format(price)}원"),
                Row(
                  children: [
                    const Text("수량:"),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.remove)),
                    Text("$quantity"),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                  ],
                ),
                Text("합계_: ${numberFormat.format(price * quantity)}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
