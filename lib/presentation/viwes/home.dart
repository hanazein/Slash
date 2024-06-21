import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/presentation/bloc/blocImp.dart';
import 'package:slash/presentation/bloc/blocState.dart';
import '../../data/model/itemModel.dart';
import '../widgets/ProductPage.dart';
import '../widgets/image_slider.dart';
import '../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeLoaded) {
          DataModel data = state.data;

          return LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 600;

              return Scaffold(
                backgroundColor: Colors.white.withOpacity(0.3),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Slash.'),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Naser City', style: TextStyle(fontSize: 16)),
                                Text(
                                  'Cairo',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Icon(Icons.notifications, size: isMobile ? 30 : 40),
                          Positioned(
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 18,
                                minHeight: 18,
                              ),
                              child: Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isMobile ? 14 : 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(isMobile ? 10 : 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: SearchField(),
                            ),
                            SizedBox(width: isMobile ? 8.0 : 16.0),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: isMobile ? 40 : 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE4E4E4).withOpacity(0.52),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(isMobile ? 6 : 9),
                                  child: ImageIcon(
                                    AssetImage('assets/images/img.png'),
                                    color: Color(0xff5F5F5F),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: isMobile ? 10.0 : 20.0),
                      ImageSlider(),
                      SizedBox(height: isMobile ? 10.0 : 20.0),

                      _buildCategorySection(context, isMobile),
                      SizedBox(height: isMobile ? 10.0 : 20.0),
                      Container(
                        height: isMobile
                            ? MediaQuery.of(context).size.height * 0.2
                            : MediaQuery.of(context).size.height * 0.25,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildCategoryItem(
                                context, 'assets/images/img_8.png', 'Fashion'),
                            _buildCategoryItem(
                                context, 'assets/images/img_9.png', 'Games'),
                            _buildCategoryItem(
                                context, 'assets/images/img_10.png', 'Accessories'),
                            _buildCategoryItem(
                                context, 'assets/images/img_11.png', 'Books'),
                            _buildCategoryItem(
                                context, 'assets/images/img_12.png', 'Artifacts'),
                            _buildCategoryItem(
                                context, 'assets/images/img_13.png', 'Pets Care'),
                          ],
                        ),
                      ),

                      SizedBox(height: isMobile ? 10.0 : 20.0),
                      _buildProductSection(context, 'Best Selling', data.bestSelling, isMobile),
                      SizedBox(height: isMobile ? 10.0 : 20.0),
                      _buildProductSection(context, 'New Arrival', data.newArrival, isMobile),
                      SizedBox(height: isMobile ? 10.0 : 20.0),
                      _buildProductSection(context, 'Recommended for you', data.recommendedForYou, isMobile),
                      SizedBox(height: isMobile ? 30 : 50),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is HomeError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(child: Text('Initial State'));
        }
      },
    );
  }

  Widget _buildCategorySection(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 10.0 : 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Categories', style: TextStyle(fontSize: isMobile ? 16 : 20, fontWeight: FontWeight.bold)),
          Row(
            children: [
              Text('See all', style: TextStyle(fontSize: isMobile ? 14 : 16, color: Colors.black)),
              Icon(Icons.arrow_forward, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductSection(BuildContext context, String title, List<BestSelling> products, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 10.0 : 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: isMobile ? 16 : 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text('See all', style: TextStyle(fontSize: isMobile ? 14 : 16, color: Colors.black)),
                  Icon(Icons.arrow_forward, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: isMobile ? 10.0 : 10.0),
        Container(
          height: isMobile ? MediaQuery.of(context).size.height * 0.44 : MediaQuery.of(context).size.height * 0.6,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              BestSelling product = products[index];
              return Container(
                width: isMobile ? 160 : 200,
                height: isMobile ? 180 : 210,
                margin: EdgeInsets.symmetric(horizontal: isMobile ? 8.0 : 16.0),
                child: ProductPage(
                  imagePath: "assets/images/img_21.png", // Assuming 'image' is a field in BestSelling
                  productName: product.name,
                  price: 'EGP \$${product.price.toStringAsFixed(2)}', // Format price as needed
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(BuildContext context, String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: kIsWeb ? MediaQuery.of(context).size.width * 0.05 : 60,
            height: kIsWeb ? MediaQuery.of(context).size.width * 0.05 : 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
