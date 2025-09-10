import 'package:ecommerce/core/network/api_client.dart';
import 'package:ecommerce/core/network/api_endpoints.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/data/repositories/product_repository.dart';
import 'package:ecommerce/presentation/bloc/category/category_bloc.dart';
import 'package:ecommerce/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(baseUrl: ApiEndpoints.baseUrl);
    final productRepository = ProductRepository(apiClient: apiClient);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(productRepository: productRepository),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) =>
              CategoryBloc(productRepository: productRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Crafty Bay Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
            primary: AppColors.primaryColor,
            secondary: AppColors.secondaryColor,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primaryColor,
            titleTextStyle: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
