import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/style/color_manager.dart';
import '../../../widgets/text_widget.dart';

class FavoriteListItemWidget extends StatelessWidget {
  const FavoriteListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        elevation: 5,
        shadowColor: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage('assets/images/category/lap.JPEG'),
                    height: 80,
                    width: 80,
                    fit: BoxFit.scaleDown,
                  ),
                  /*  if (getCurrentProduct.isOnSale)
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                            child: Text(
                              'on Sale',
                            )),
                      ),
                    ),*/
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextWidget(
                      text: 'Title',
                      color: Colors.black,
                      textSize: 20,
                    ),
                  ),
                  TextWidget(
                    text: 'productCategoryName',
                    color: Colors.grey,
                    textSize: 15,
                  ),
                  RatingBarIndicator(
                    itemSize: 20.0,
                    // rating: getCurrentProduct.rate!.toDouble(),
                    rating: 3,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    direction: Axis.horizontal,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  /*         if (getCurrentProduct.isDiscount!)
                    Row(
                      children: [
                        Text('${getCurrentProduct.price}\$',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${getCurrentProduct.salePrice}\$',
                          style: TextStyle(color: ColorManager.primary),
                        ),
                      ],
                    ),
                  if (!getCurrentProduct.isDiscount!)*/
                  Text(
                    '${10}\$',
                    style: TextStyle(color: ColorManager.primary),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  /// TODO remove one item
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      IconlyLight.delete,
                      size: 26,
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 2.5,
              ),
              InkWell(
                onTap: () {
                  //TODO PAYMENT METHODE
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.credit_card,
                      size: 26,
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
