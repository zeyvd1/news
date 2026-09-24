import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/widgets/app_bottom_nav.dart';
import 'package:news/features/book_mark/view/bookmark_screen.dart';
import 'package:news/features/home/view/home_screen.dart';
import 'package:news/features/weather/view/weather_screen.dart';


class ExploreItem {
  final String title;
  final String category;

  ExploreItem({
    required this.title,
    required this.category,
  });
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  static const _categories = [
    'Travel',
    'Technology',
    'Business',
    'Politics',
  ];

  String _selected = 'Travel';

  final List<ExploreItem> articles = [
    ExploreItem(
      title: 'Exploring the World\'s Best Beaches',
      category: 'Travel',
    ),
    ExploreItem(
      title: 'Hidden Gems Around The World',
      category: 'Travel',
    ),
    ExploreItem(
      title: 'The Future of Artificial Intelligence',
      category: 'Technology',
    ),
    ExploreItem(
      title: 'Flutter Development Trends',
      category: 'Technology',
    ),
    ExploreItem(
      title: 'Remote Work and Productivity',
      category: 'Business',
    ),
    ExploreItem(
      title: 'Global Economic Updates',
      category: 'Politics',
    ),
  ];

  void _onNavTap(int index) {
    if (index == 1) return;

    Widget screen;

    switch (index) {
      case 0:
        screen = const HomeScreen();
        break;
      case 2:
        screen = const BookmarkScreen();
        break;
      default:
        screen = const WeatherScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = articles
        .where((article) => article.category == _selected)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                12,
                20,
                8,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                itemCount: _categories.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final selected =
                      category == _selected;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selected = category;
                      });
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.dark
                            : AppColors.chipBg,
                        borderRadius:
                            BorderRadius.circular(20),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: selected
                              ? Colors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  8,
                  20,
                  100,
                ),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final article = filtered[index];

                  return Container(
                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight:
                                FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          article.category,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: AppBottomNav(
        currentIndex: 1,
        onTap: _onNavTap,
      ),
    );
  }
}