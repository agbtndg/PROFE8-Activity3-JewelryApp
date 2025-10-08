import 'package:flutter/material.dart';
import 'package:jewel_form/about_screen.dart';
import 'package:jewel_form/contact_screen.dart';
import 'package:jewel_form/customization_screen.dart';
import 'package:jewel_form/demo_push_replacement_screen.dart';
import 'package:jewel_form/demo_push_screen.dart';
import 'package:jewel_form/login_screen.dart';
import 'package:jewel_form/order_form_screen.dart';
import 'package:jewel_form/registration_screen.dart';
import 'package:jewel_form/tabbed_jewelry_screen.dart';
import 'package:jewel_form/tabbed_order_screen.dart';
import 'package:jewel_form/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'login_screen.dart';
import 'customization_screen.dart';
import 'registration_screen.dart';
import 'order_form_screen.dart';
import 'welcome_screen.dart';
import 'tabbed_order_screen.dart';
import 'about_screen.dart';
import 'contact_screen.dart';
import 'demo_push_screen.dart';
import 'demo_push_replacement_screen.dart';
import 'tabbed_jewelry_screen.dart';
import 'screens/add_item_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/jewelry_counter_screen.dart';
import 'screens/provider_demo_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: JewelForm(),
    ),
  );
}

class JewelForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JewelForm',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => MainScreen(),
        '/about': (context) => AboutScreen(),
        '/contact': (context) => ContactScreen(),
        '/demo_push': (context) => DemoPushScreen(),
        '/demo_push_replacement': (context) => DemoPushReplacementScreen(),
        '/tabbed_jewelry': (context) => TabbedJewelryScreen(),
        '/add_item': (context) => AddItemScreen(),
        '/cart': (context) => CartScreen(),
        '/jewelry_counter': (context) => JewelryCounterScreen(),
        '/provider_demo': (context) => ProviderDemoScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    RegistrationScreen(),
    OrderFormScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30.0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30.0),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 30.0),
            label: 'Orders',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey[800],
        unselectedItemColor: Colors.blueGrey[300],
        iconSize: 30.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JewelForm'),
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
              title: Text('Welcome'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Username Form'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsernameFormScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Order Form'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderFormScreen()),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              title: Text('Add Item to Cart'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, '/add_item');
              },
            ),
            ListTile(
              title: Text('View Cart'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, '/cart');
              },
            ),
            ListTile(
              title: Text('Jewelry Counter'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, '/jewelry_counter');
              },
            ),
            ListTile(
              title: Text('Provider Demo'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, '/provider_demo');
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
                child: Text('Welcome Screen'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsernameFormScreen()),
                  );
                },
                child: Text('Username Form'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Login Form'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomizationScreen()),
                  );
                },
                child: Text('Customize Jewelry'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationScreen()),
                  );
                },
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderFormScreen()),
                  );
                },
                child: Text('Order Form'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TabbedOrderScreen()),
                  );
                },
                child: Text('Manage Orders'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text('About'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: Text('Contact'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/demo_push');
                },
                child: Text('Demo Push'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/demo_push_replacement');
                },
                child: Text('Demo Push Replacement'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tabbed_jewelry');
                },
                child: Text('Jewelry Tabs'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add_item');
                },
                child: Text('Add Item to Cart'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                child: Text('View Cart'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/jewelry_counter');
                },
                child: Text('Jewelry Counter'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/provider_demo');
                },
                child: Text('Provider Demo'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UsernameFormScreen extends StatefulWidget {
  @override
  _UsernameFormScreenState createState() => _UsernameFormScreenState();
}

class _UsernameFormScreenState extends State<UsernameFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Username'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String username = _usernameController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Username submitted: $username')),
                    );
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}