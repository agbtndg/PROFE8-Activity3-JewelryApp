import 'package:flutter/material.dart';
import 'customization_screen.dart';
import 'order_form_screen.dart';

class TabbedOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Manage Orders'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Customize'),
              Tab(text: 'Orders'),
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
          ],
        ),
      ),
    );
  }
}