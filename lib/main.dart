import 'package:flutter/material.dart';

void main() {
  runApp(SastaAbayaStore());
}

class SastaAbayaStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> products = [
    {
      'name': '211WN reversible angora cardigan',
      'price': '\$120',
      'image': 'assets/a.webp',
      'category': 'Abaya',
      'description': 'Elegant reversible angora cardigan with style.',
      'status': 'Affiliated',
    },
    {
      'name': 'Moroccan abaya wide sleeves',
      'price': '\$130',
      'image': 'assets/b.jpeg',
      'category': 'Abaya',
      'description': 'Traditional Moroccan abaya with wide sleeves.',
      'status': 'Non-Affiliated',
    },
    {
      'name': 'Floral printed summer abaya',
      'price': '\$110',
      'image': 'assets/c.jpeg',
      'category': 'Abaya',
      'description': 'Light and airy floral printed summer abaya.',
      'status': 'Non-Affiliated',
      'link': 'https://www.example.com/product3',
    },
    {
      'name': 'Classic white Ramadan abaya',
      'price': '\$170',
      'image': 'assets/d.jpeg',
      'category': 'Abaya',
      'description': 'Classic white abaya for Ramadan season.',
      'status': 'Affiliated',
      'link': 'https://www.example.com/product4',
    },
    {
      'name': 'Elegant black evening abaya',
      'price': '\$150',
      'image': 'assets/e.jpeg',
      'category': 'Abaya',
      'description': 'Elegant black abaya for evening events.',
      'status': 'Non-Affiliated',
      'link': 'https://www.example.com/product5',
    },
    {
      'name': 'Chic summer abaya with embroidery',
      'price': '\$140',
      'image': 'assets/f.jpeg',
      'category': 'Abaya',
      'description': 'Stylish summer abaya with embroidery work.',
      'status': 'Affiliated',
      'link': 'https://www.example.com/product6',
    },
  ];
  List<Map<String, String>> wishlist = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    if (_selectedIndex == 0) {
      currentPage = HomePageContent(
        products: products,
        onAddToWishlist: _addToWishlist,
      );
    } else if (_selectedIndex == 1) {
      currentPage = AdminLoginPage();
    } else if (_selectedIndex == 2) {
      currentPage = CartPage(wishlist: wishlist);
    } else if (_selectedIndex == 3) {
      currentPage = ReportPage(products: products);
    } else {
      currentPage = Center(child: Text('Feature Coming Soon'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sasta Abaya Store'),
        centerTitle: true,
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Report',
          ),
        ],
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  void _addToWishlist(Map<String, String> product) {
    setState(() {
      wishlist.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product['name']} added to wishlist!')),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function(Map<String, String>) onAddToWishlist;

  HomePageContent({required this.products, required this.onAddToWishlist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search products...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: product,
                        onAddToWishlist: onAddToWishlist,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          product['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product['price']!,
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Center(
                        child: IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {
                            onAddToWishlist(product);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;
  final Function(Map<String, String>) onAddToWishlist;

  ProductDetailPage({required this.product, required this.onAddToWishlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product['image']!),
            SizedBox(height: 16.0),
            Text(
              product['name']!,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              product['price']!,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product['description']!,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  onAddToWishlist(product);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(wishlist: [product]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, String>> wishlist;

  CartPage({required this.wishlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          final product = wishlist[index];
          return ListTile(
            title: Text(product['name']!),
            subtitle: Text(product['price']!),
            leading: Image.asset(
              product['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == 'momna' && _passwordController.text == '123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid login credentials!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Map<String, String>> adminProducts = [
    {
      'name': '211WN reversible angora cardigan',
      'price': '\$120',
      'image': 'assets/a.webp',
      'category': 'Abaya',
      'description': 'Elegant reversible angora cardigan with style.',
      'status': 'Affiliated',
    },
  ];

  void _showProductActions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose an action'),
        content: Text('Choose an action to manage products'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Edit'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Panel')),
      body: ListView.builder(
        itemCount: adminProducts.length,
        itemBuilder: (context, index) {
          final product = adminProducts[index];
          return Card(
            child: ListTile(
              title: Text(product['name']!),
              subtitle: Text(product['category']!),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  _showProductActions(context);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  final List<Map<String, String>> products;

  ReportPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              title: Text(product['name']!),
              subtitle: Text(product['category']!),
            ),
          );
        },
      ),
    );
  }
}
