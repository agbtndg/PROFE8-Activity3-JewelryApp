import 'package:flutter/material.dart';
import 'package:jewel_form/main.dart';
import 'package:jewel_form/order_form_screen.dart';
import 'package:jewel_form/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
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

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    try {
      await _audioPlayer.setSourceUrl('https://example.com/jewelry_jingle.mp3');
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      setState(() {
        _isInitialized = false;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jewelry Audio'),
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
          ],
        ),
      ),
      body: Center(
        child: _isInitialized
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white70
                            : Colors.blueGrey[800]!,
                        width: 2.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/jewelry_logo.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white.withOpacity(0.9)
                            : null,
                        colorBlendMode: Theme.of(context).brightness == Brightness.dark
                            ? BlendMode.modulate
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_isPlaying) {
                        await _audioPlayer.pause();
                      } else {
                        await _audioPlayer.play(
                          UrlSource('https://example.com/jewelry_jingle.mp3'),
                        );
                      }
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                    child: Text(_isPlaying ? 'Pause' : 'Play'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      backgroundColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.blueGrey[300]
                          : Colors.blueGrey,
                      foregroundColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.black87
                          : Colors.white,
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
                    'Failed to load audio',
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