import 'package:flutter/material.dart';
import 'customization_screen.dart';
import 'order_form_screen.dart';
import 'gallery_screen.dart';

class TabbedJewelryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Jewelry Studio'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Design'),
              Tab(text: 'Orders'),
              Tab(text: 'Gallery'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.blueGrey[200],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            CustomizationScreen(),
            OrderFormScreen(),
            GalleryScreen(),
          ],
        ),
      ),
    );
  }
}