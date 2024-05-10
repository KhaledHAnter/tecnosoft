import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tecnosoft_task/Models/cart_model.dart';
import 'package:tecnosoft_task/Models/item_model.dart';
import 'package:tecnosoft_task/Views/user_details_view.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/Widgets/cart_item.dart';
import 'package:tecnosoft_task/Widgets/custom_app_bar.dart';
import 'package:tecnosoft_task/constants.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  static const String id = 'Cart';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int numOfItem = 1;
  double totalPrice = 0.0;

  List<CartModel> cart = [];
  List<int> ids = [];
  List<double> productpricemultiplied = [];
  List<ItemModel> products = [];

  getCartData() async {
    QuerySnapshot CartquerySnapshot =
        await FirebaseFirestore.instance.collection("Cart").get();
    setState(() {
      // products.addAll();
      for (int i = 0; i < CartquerySnapshot.docs.length; i++) {
        cart.add(CartModel.fromJson(CartquerySnapshot.docs[i].data()));
        ids.add(cart[i].id);
        productpricemultiplied.add(cart[i].price * cart[i].quantity);
      }
    });
    QuerySnapshot ProductquerySnapshot = await FirebaseFirestore.instance
        .collection("Items")
        .where("id", whereIn: ids)
        .get();

    setState(() {
      // products.addAll();
      for (int i = 0; i < ids.length; i++) {
        products.add(ItemModel.fromJson(ProductquerySnapshot.docs[i].data()));
      }
    });
    print(productpricemultiplied);
    // for (int i = 0; i < productpricemultiplied.length; i++) {
    //   totalPrice += productpricemultiplied[i];
    // }
  }

  @override
  void initState() {
    getCartData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: CustomAppBar(
                onTap: () {},
                icon1: FontAwesomeIcons.chevronLeft,
                icon2: FontAwesomeIcons.ellipsis,
                text: "My Cart",
              ),
            ),
            Gap(18.h),
            const Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 350.h,
              width: double.infinity,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    totalPrice += productpricemultiplied[index];
                    return Column(
                      children: [
                        CartItem(
                          name: products[index].name,
                          image: products[index].images[0],
                          price: products[index].price,
                          numOfItem: cart[index].quantity,
                          gender: products[index].gender,
                          onAdd: () {
                            setState(() {
                              cart[index].quantity++;
                            });
                          },
                          onRemove: () {
                            setState(() {
                              if (cart[index].quantity > 1) {
                                cart[index].quantity--;
                              }
                            });
                          },
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                      ],
                    );
                  }),
            ),
            Gap(18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "Subtotal :",
                    size: 20.sp,
                    color: Colors.grey.shade600,
                  ),
                  AppText(
                    text: "\$ ${totalPrice.toStringAsFixed(2)}",
                    size: 20.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "Delivery Fee :",
                    size: 20.sp,
                    color: Colors.grey.shade600,
                  ),
                  AppText(
                    text: "\$ 10.00",
                    size: 20.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "Discount :",
                    size: 20.sp,
                    color: Colors.grey.shade600,
                  ),
                  AppText(
                    text: "10%",
                    size: 20.sp,
                    weight: FontWeight.bold,
                    color: Colors.red.shade700,
                  ),
                ],
              ),
            ),
            Gap(32.h),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "Total :",
                    size: 20.sp,
                    color: Colors.grey.shade600,
                  ),
                  AppText(
                    text:
                        "\$ ${((totalPrice + 10) - (totalPrice * 0.1)).toStringAsFixed(2)}",
                    size: 20.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, UserDetails.id);
              },
              child: Container(
                constraints: BoxConstraints(minHeight: 50.h),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: kYallowColor,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: const Center(
                  child: AppText(text: "Check Out"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
