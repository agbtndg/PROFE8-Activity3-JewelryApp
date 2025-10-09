import 'package:flutter/material.dart';
import 'package:jewel_form/main.dart';
import 'package:jewel_form/order_form_screen.dart';
import 'package:jewel_form/welcome_screen.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../welcome_screen.dart';
import '../main.dart';
import '../order_form_screen.dart';
import '../about_screen.dart';
import '../contact_screen.dart';
import 'add_item_screen.dart';
import 'cart_screen.dart';
import 'jewelry_counter_screen.dart';
import '../provider_demo_screen.dart';
import 'todo_screen.dart';
import 'video_player_screen.dart';
import 'audio_player_screen.dart';

class IconDisplayScreen extends StatefulWidget {
  @override
  _IconDisplayScreenState createState() => _IconDisplayScreenState();
}

class _IconDisplayScreenState extends State<IconDisplayScreen> {
  double _iconSize = 50.0;
  double _redValue = 0.0;
  double _greenValue = 0.0;
  double _blueValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Display'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'JewelForm Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Toggle Theme'),
              trailing: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                  );
                },
              ),
            ),
            ListTile(
              title: Text('Welcome'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Username Form'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsernameFormScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Order Form'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderFormScreen()),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              title: Text('Add Item to Cart'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/add_item');
              },
            ),
            ListTile(
              title: Text('View Cart'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart');
              },
            ),
            ListTile(
              title: Text('Jewelry Counter'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/jewelry_counter');
              },
            ),
            ListTile(
              title: Text('Provider Demo'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/provider_demo');
              },
            ),
            ListTile(
              title: Text('To-Do List'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/todo');
              },
            ),
            ListTile(
              title: Text('Video Player'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/video_player');
              },
            ),
            ListTile(
              title: Text('Audio Player'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/audio_player');
              },
            ),
            ListTile(
              title: Text('Icon Display'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/icon_display');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.diamond,
                      size: _iconSize,
                      color: Color.fromRGBO(
                        _redValue.toInt(),
                        _greenValue.toInt(),
                        _blueValue.toInt(),
                        1.0,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      size: _iconSize,
                      color: Color.fromRGBO(
                        _redValue.toInt(),
                        _greenValue.toInt(),
                        _blueValue.toInt(),
                        1.0,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      size: _iconSize,
                      color: Color.fromRGBO(
                        _redValue.toInt(),
                        _greenValue.toInt(),
                        _blueValue.toInt(),
                        1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      'Icon Size: ${_iconSize.toStringAsFixed(1)}',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                        fontSize: 16.0,
                      ),
                    ),
                    Slider(
                      value: _iconSize,
                      min: 20.0,
                      max: 100.0,
                      divisions: 80,
                      label: _iconSize.toStringAsFixed(1),
                      activeColor: isDarkMode ? Colors.blueGrey[300] : Colors.blueGrey,
                      inactiveColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                      onChanged: (value) {
                        setState(() {
                          _iconSize = value;
                        });
                      },
                    ),
                    Text(
                      'Red: ${_redValue.toInt()}',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                        fontSize: 16.0,
                      ),
                    ),
                    Slider(
                      value: _redValue,
                      min: 0.0,
                      max: 255.0,
                      divisions: 255,
                      label: _redValue.toInt().toString(),
                      activeColor: Colors.red,
                      inactiveColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                      onChanged: (value) {
                        setState(() {
                          _redValue = value;
                        });
                      },
                    ),
                    Text(
                      'Green: ${_greenValue.toInt()}',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                        fontSize: 16.0,
                      ),
                    ),
                    Slider(
                      value: _greenValue,
                      min: 0.0,
                      max: 255.0,
                      divisions: 255,
                      label: _greenValue.toInt().toString(),
                      activeColor: Colors.green,
                      inactiveColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                      onChanged: (value) {
                        setState(() {
                          _greenValue = value;
                        });
                      },
                    ),
                    Text(
                      'Blue: ${_blueValue.toInt()}',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                        fontSize: 16.0,
                      ),
                    ),
                    Slider(
                      value: _blueValue,
                      min: 0.0,
                      max: 255.0,
                      divisions: 255,
                      label: _blueValue.toInt().toString(),
                      activeColor: Colors.blue,
                      inactiveColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                      onChanged: (value) {
                        setState(() {
                          _blueValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}