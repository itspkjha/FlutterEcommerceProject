// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catalogue/pages/home_widgets/add_to_cart.dart';
import 'package:flutter_catalogue/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalogue.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: const EdgeInsets.all(0),
          children: [
            "\$${catalog.price}".text.xl4.bold.make(),
            AddToCart(
              catalog: catalog,
            ).wh(120, 50),
          ],
        ).p32(),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
              .h32(context),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              width: context.screenWidth,
              color: context.cardColor,
              child: Column(children: [
                catalog.name.text.xl4.color(MyTheme.darkBluishColor).make(),
                catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                10.heightBox,
                "mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc vel risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est velit egestas dui id ornare arcu odio ut sem nulla pharetra"
                    .text
                    .textStyle(context.captionStyle)
                    .justify
                    .make()
                    .px12()
              ]).py64(),
            ),
          ))
        ]),
      ),
    );
  }
}
