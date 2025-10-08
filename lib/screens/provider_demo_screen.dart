import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ProviderDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'context.watch() Demo',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'This uses context.watch() to listen to CartProvider and rebuild the UI when jewelryCount changes.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blueGrey[50],
              child: Column(
                children: [
                  Text(
                    'Jewelry Count: ${context.watch<CartProvider>().jewelryCount}',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<CartProvider>().incrementCount();
                        },
                        child: Text('Add Item'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CartProvider>().decrementCount();
                        },
                        child: Text('Remove Item'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'context.read() Demo',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'This uses context.read() to access CartProvider without listening. The count below won\'t update until you navigate away and back.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blueGrey[50],
              child: Column(
                children: [
                  Text(
                    'Jewelry Count (read): ${context.read<CartProvider>().jewelryCount}',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<CartProvider>().incrementCount();
                        },
                        child: Text('Add Item'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CartProvider>().decrementCount();
                        },
                        child: Text('Remove Item'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Note: context.watch() updates the UI instantly. context.read() does not, so the count only updates on rebuild (e.g., navigate back).',
              style: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}