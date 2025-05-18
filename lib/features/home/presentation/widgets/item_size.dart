import '../../../../core/theme.dart';
import 'package:flutter/material.dart';

class ItemSize extends StatefulWidget {
  const ItemSize({super.key});

  @override
  State<ItemSize> createState() => _ItemSizeState();
}

class _ItemSizeState extends State<ItemSize> {
  List<String> sizeList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sizeList.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: currentIndex == index ? mainColor : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                sizeList[index],
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
