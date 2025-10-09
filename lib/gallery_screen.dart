import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/theme_provider.dart';
import 'welcome_screen.dart';
import 'main.dart';
import 'order_form_screen.dart';
import 'about_screen.dart';
import 'contact_screen.dart';
import 'screens/add_item_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/jewelry_counter_screen.dart';
import 'provider_demo_screen.dart';
import 'screens/todo_screen.dart';
import 'screens/video_player_screen.dart';
import 'screens/audio_player_screen.dart';
import 'screens/icon_display_screen.dart';
import 'screens/custom_icon_screen.dart';
import 'screens/custom_font_screen.dart';
import 'screens/profile_card_screen.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _currentIndex = 0;
  final List<String> _imagePaths = [
    'assets/images/jewelry_logo.png',
    'assets/images/jewelry_2.png',
    'assets/images/jewelry_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Jewelry Gallery'),
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
                  fontFamily: 'Poppins',
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
                Navigator.pushNamed(context, '/add_item');
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
            ListTile(
              title: Text('Custom Fonts'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/custom_font');
              },
            ),
            ListTile(
              title: Text('Profile Card'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile_card');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Explore Our Jewelry Collection',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      enlargeCenterPage: true,
                      aspectRatio: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: _imagePaths.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: isDarkMode ? Colors.white70 : Colors.blueGrey[800]!,
                                width: 2.0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                color: isDarkMode ? Colors.white.withOpacity(0.9) : null,
                                colorBlendMode: isDarkMode ? BlendMode.modulate : null,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _imagePaths.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? (isDarkMode ? Colors.blueGrey[300] : Colors.blueGrey[800])
                              : (isDarkMode ? Colors.white70.withOpacity(0.4) : Colors.black87.withOpacity(0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}