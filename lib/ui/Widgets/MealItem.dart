import 'package:ecommerce_grocery/Model/productdata.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key key, this.meal}) : super(key: key);
  final CardItem meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: ClipRect(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                height: double.infinity,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(meal.productImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                meal.productName,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ),
          )
        ],
      ),
    );
  }
}
