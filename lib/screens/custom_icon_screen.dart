import 'package:flutter/material.dart';
import 'package:jewel_form/main.dart';
import 'package:jewel_form/order_form_screen.dart';
import 'package:jewel_form/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
import 'icon_display_screen.dart';

class CustomIconScreen extends StatefulWidget {
  @override
  _CustomIconScreenState createState() => _CustomIconScreenState();
}

class _CustomIconScreenState extends State<CustomIconScreen> {
  IconData? _selectedIcon = FontAwesomeIcons.gem;

  // List of jewelry-related FontAwesome icons
  final List<IconData> _jewelryIcons = [
    FontAwesomeIcons.gem,
    FontAwesomeIcons.ring,
    FontAwesomeIcons.star,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.crown,
  ];

  Future<void> _pickIcon() async {
    IconData? icon = await showIconPicker(
      context,
      // You may specify iconPickerShape or other supported parameters if needed
    ) as IconData?;

    if (icon != null) {
      setState(() {
        _selectedIcon = icon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Icons'),
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
            ListTile(
              title: Text('Custom Icons'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/custom_icon');
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
                child: Text(
                  'Selected Icon:',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              ),
              FaIcon(
                _selectedIcon,
                size: 100.0,
                color: isDarkMode ? Colors.blueGrey[300] : Colors.blueGrey[800],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _pickIcon,
                child: Text('Pick Custom Icon'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  backgroundColor: isDarkMode ? Colors.blueGrey[300] : Colors.blueGrey,
                  foregroundColor: isDarkMode ? Colors.black87 : Colors.white,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Jewelry Icon Set:',
                style: TextStyle(
                  fontSize: 20.0,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 200.0,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  children: _jewelryIcons.map((icon) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIcon = icon;
                        });
                      },
                      child: FaIcon(
                        icon,
                        size: 50.0,
                        color: isDarkMode ? Colors.blueGrey[300] : Colors.blueGrey[800],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}