import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/cart/cart_cubit.dart';
import 'package:food_app/blocs/restaurant/restaurant_bloc.dart';
import 'package:food_app/repositories/mock_food_repository.dart';
import 'package:food_app/ui/screens/home_screen.dart';

void main() {
  final repo = MockFoodRepository();
  runApp(MyApp(repo: repo));
}

class MyApp extends StatelessWidget {
  final MockFoodRepository repo;
  const MyApp({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RestaurantBloc(repo: repo)..add(LoadRestaurants()),
        ),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: MaterialApp(
        title: 'Food Order Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
