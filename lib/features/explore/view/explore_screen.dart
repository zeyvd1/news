import 'package:flutter/material.dart';
import 'package:news/core/widgets/app_bottom_nav.dart';
import 'package:news/features/book_mark/view/bookmark_screen.dart';
import 'package:news/features/home/view/home_screen.dart';
import 'package:news/features/weather/view/weather_screen.dart';
import 'search_screen.dart';

class Article {
  final String title, author, date, category, image, avatar;

  const Article(
    this.title,
    this.author,
    this.date,
    this.category,
    this.image,
    this.avatar,
  );
}

const articles = [
  Article(
    'Uncovering the Hidden Gems of the Amazon Forest',
    'Mr. Lana Kub',
    'May 1, 2023',
    'Travel',
    'assets/images/EX1.png',
    'assets/images/Avatar1.png',
  ),
  Article(
    'Experience the Serenity of Japan\'s Traditional Gardens',
    'Hilda Friesen',
    'May 3, 2023',
    'Travel',
    'assets/images/ex2.png',
    'assets/images/Avatar2.png',
  ),
  Article(
    'A Journey Through Time: Discovering the Nile river',
    'Melissa White',
    'May 7, 2023',
    'Travel',
    'assets/images/ex3.png',
    'assets/images/avatar3.png',
  ),
  Article(
    'Chasing the Northern Lights: A Winter in Finland',
    'Jeannie Conn',
    'May 12, 2023',
    'Travel',
    'assets/images/ex4.png',
    'assets/images/avatar4.png',
  ),
];

const categories = [
  'Travel',
  'Technology',
  'Business',
];

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _selected = categories.first;

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
    final items =
        articles.where((a) => a.category == _selected).toList();

    final featured = items.isEmpty ? null : items.first;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xFFE8ECF8),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(24, 16, 16, 12),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Explore',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const SearchScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 34,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      itemCount: categories.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(width: 8),
                      itemBuilder: (_, i) {
                        final c = categories[i];
                        final sel = c == _selected;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selected = c;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: sel
                                  ? const Color(0xFFE3E8F7)
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.circular(20),
                              border: Border.all(
                                color: sel
                                    ? const Color(0xFFE3E8F7)
                                    : const Color(0xFFE5E7EB),
                              ),
                            ),
                            child: Text(
                              c,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: sel
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),

          Expanded(
            child: featured == null
                ? const Center(
                    child: Text('No articles'),
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(
                      24,
                      20,
                      24,
                      24,
                    ),
                    children: [
                      _img(
                        featured.image,
                        w: 366,
                        h: 208,
                        r: 8,
                      ),

                      const SizedBox(height: 16),

                      Text(
                        featured.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      _author(featured),

                      const SizedBox(height: 14),

                      for (final a in items.skip(1)) _tile(a),
                    ],
                  ),
          ),
        ],
      ),

      bottomNavigationBar: AppBottomNav(
        currentIndex: 1,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _tile(Article a) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  a.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                _author(a),
              ],
            ),
          ),

          const SizedBox(width: 16),

          _img(
            a.image,
            w: 112,
            h: 80,
            r: 8,
          ),
        ],
      ),
    );
  }

  Widget _author(Article a) {
    return Row(
      children: [
        _img(
          a.avatar,
          w: 24,
          h: 24,
          r: 12,
        ),

        const SizedBox(width: 6),

        Text(
          '${a.author} · ${a.date}',
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }

  Widget _img(
    String path, {
    double? w,
    double? h,
    double r = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(r),
      child: Image.asset(
        path,
        width: w,
        height: h,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: w,
          height: h,
          color: const Color(0xFFE3E5EA),
        ),
      ),
    );
  }
}