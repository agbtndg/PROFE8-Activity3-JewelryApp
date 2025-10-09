import 'package:flutter/material.dart';
import 'package:jewel_form/main.dart';
import 'package:jewel_form/order_form_screen.dart';
import 'package:jewel_form/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
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

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://www.pexels.com/video/11000660/download/',
    )..initialize().then((_) {
        setState(() {
          _isInitialized = true;
          _chewieController = ChewieController(
            videoPlayerController: _controller,
            autoPlay: false,
            looping: false,
            materialProgressColors: ChewieProgressColors(
              playedColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.blueGrey[300]!
                  : Colors.blueGrey[800]!,
              handleColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.blueGrey[800]!,
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[800]!
                  : Colors.grey[300]!,
              bufferedColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[700]!
                  : Colors.grey[400]!,
            ),
            showControls: true,
            allowFullScreen: true,
            allowMuting: true,
            allowPlaybackSpeedChanging: true,
          );
        });
      }).catchError((error) {
        setState(() {
          _isInitialized = false;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jewelry Video'),
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
          ],
        ),
      ),
      body: Center(
        child: _isInitialized && _chewieController != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Chewie(
                      controller: _chewieController!,
                    ),
                  ),
                ],
              )
            : Container(
                width: 300,
                height: 200,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[800]
                    : Colors.grey[300],
                child: Center(
                  child: Text(
                    'Failed to load video',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.black87,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}