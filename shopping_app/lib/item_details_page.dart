import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/constant.dart';

class ItemDetailsPage extends StatefulWidget {
  int productNo;
  String productName;
  String productImageUrl;
  double price;
  ItemDetailsPage(
      {super.key,
      required this.productNo,
      required this.productName,
      required this.productImageUrl,
      required this.price});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("제품 상세 페이지"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        //짤리지 않게 스크롤 내려줄 수 있는 위젯
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
                imageUrl:
                    widget.productImageUrl, //**** 다른 위젯에서 불러올때 .. 꼭 기억하자 */
                placeholder: (context, url) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2), //로딩중~
                  );
                },
                errorWidget: (context, url, error) {
                  return const Center(
                    child: Text('오류 발생'),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                widget.productName,
                textScaler: const TextScaler.linear(1.5),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "${numberFormat.format(widget.price)}원",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: () {},
          child: const Text("장바구니 담기"),
        ),
      ),
    );
  }

  void onPressed() {}
}
