import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'api_service.dart';
import 'product_cubit.dart';
import 'cart_cubit.dart';
import 'product_list_screen.dart';
import 'cart_screen.dart';
import 'product_details_screen.dart';
import 'cart_item.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox<CartItem>('cart');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(ApiService())..fetchProducts(),
        ),
        BlocProvider(
          create: (context) => CartCubit(Hive.box<CartItem>('cart')),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(),
          '/cart': (context) => CartScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/details') {
            final product = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product),
            );
          }
          return null;
        },
      ),
    );
  }
}
