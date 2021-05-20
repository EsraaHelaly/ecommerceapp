import 'package:ecommerceapp/constants.dart';
import 'package:ecommerceapp/core/view_model/home_view_model.dart';
import 'package:ecommerceapp/view/details_view.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);
  final List name = ['a', 'a', 'a', 'a', 'a'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: [
                    _seachTextField(),
                    SizedBox(height: 30),
                    CustomText(text: 'Categories', fontsize: 22),
                    SizedBox(height: 30),
                    _listCategory(),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Best Selling', fontsize: 22),
                        CustomText(text: 'See All', fontsize: 17),
                      ],
                    ),
                    SizedBox(height: 40),
                    _bestSellingProducts(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _bestSellingProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(
                  model: controller.productModel[index] ,
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.network(
                          controller.productModel[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: controller.productModel[index].name,
                      fontsize: 20,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: controller.productModel[index].desc,
                      fontsize: 15,
                      alignment: Alignment.bottomLeft,
                      color: Colors.grey,
                      maxline: 1,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: controller.productModel[index].price.toString() +
                          '\$ ',
                      fontsize: 20,
                      alignment: Alignment.bottomLeft,
                      color: kprimaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 30,
          ),
        ),
      ),
    );
  }

  Widget _listCategory() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  width: 60,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(height: 10),
                Text(controller.categoryModel[index].name),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 30,
          ),
        ),
      ),
    );
  }

  Widget _seachTextField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
