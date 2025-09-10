import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/category/category_bloc.dart';
import '../bloc/category/category_state.dart' as category_state;
import '../bloc/category/category_event.dart' as category_event;
import 'package:ecommerce/presentation/bloc/product/product_state.dart' as product_state;
import 'package:ecommerce/presentation/bloc/product/product_event.dart' as product_event;
import '../widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCarouselIndex = 0;
  final List<String> _carouselItems = [
    'https://ecommerce-api.codesilicon.com/images/product1.jpeg',
    'https://ecommerce-api.codesilicon.com/images/product1.jpeg',
    'https://ecommerce-api.codesilicon.com/images/product1.jpeg',
    'https://ecommerce-api.codesilicon.com/images/product1.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(const category_event.LoadCategories());
    context.read<ProductBloc>().add(const product_event.LoadPopularProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/app-logo.png', width: 150, height: 100),
            const SizedBox(width: 8),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person, color: AppColors.secondaryColor),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone, color: AppColors.secondaryColor),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: AppColors.darkGrey),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: AppColors.darkGrey),
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                ),
              ),
            ),
            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarouselIndex = index;
                  });
                },
              ),
              items: _carouselItems.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 16.0,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Happy New Year',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'Special Deal\nSave 30%',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text('Buy Now'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            // Carousel Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _carouselItems.asMap().entries.map((entry) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentCarouselIndex == entry.key
                        ? AppColors.primaryColor
                        : AppColors.lightGrey,
                  ),
                );
              }).toList(),
            ),
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<CategoryBloc, category_state.CategoryState>(
              builder: (context, state) {
                if (state is category_state.CategoriesLoaded) {
                  return SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: CategoryCard(
                            category: state.categories[index],
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is category_state.CategoryLoading) {
                  return const SizedBox(
                    height: 120,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return const SizedBox(
                    height: 120,
                    child: Center(child: Text('No categories found')),
                  );
                }
              },
            ),
            // Popular Products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<ProductBloc, product_state.ProductState>(
              builder: (context, state) {
                if (state is product_state.PopularProductsLoaded) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                        ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: state.products[index],
                        onTap: () {},
                      );
                    },
                  );
                } else if (state is product_state.ProductLoading) {
                  return const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator(),),
                  );
                } else {
                  return const SizedBox(
                    height: 200,
                    child: Center(child: Text('No products found'),),
                  );
                }
              },
            ),
          ],
        ),
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.darkGrey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Wish',
          ),
        ],
      ),
    );
  }
}
