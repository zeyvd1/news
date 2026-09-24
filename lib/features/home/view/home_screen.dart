import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/widgets/app_bottom_nav.dart';
import 'package:news/features/article/views/article.dart';
import 'package:news/features/book_mark/view/bookmark_screen.dart';
import 'package:news/features/explore/view/explore_screen.dart';
import 'package:news/features/weather/view/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static const List<Map<String, String>> articles = [
    {
      'title':
          'Experience the Serenity of Japan\'s\nTraditional Countryside',
      'author': 'Luc Olinga',
      'date': 'Apr 9, 2023',
      'category': 'Travel',
      'image': 'assets/images/home1.png',
    },
    {
      'title': 'The Pros and Cons of Remote Work',
      'author': 'Sophie Larkin',
      'date': 'May 10, 2023',
      'category': 'Technology',
      'image': 'assets/images/home2.png',
    },
    {
      'title':
          'A Journey Through Time: Discovering the Nile river',
      'author': 'Melissa White',
      'date': 'May 7, 2023',
      'category': 'Travel',
      'image': 'assets/images/home3.png',
    },
  ];

  void _onNavTap(int index) {

    // Already on Home
    if (index == 0) return;

    Widget screen;

    switch (index) {

      case 1:
        screen = const ExploreScreen();
        break;

      case 2:
        screen = const BookmarkScreen();
        break;

      default:
        screen = const WeatherScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => screen,
      ),
    );
  }

  void openArticle(
    BuildContext context,
    Map<String, String> article,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleScreen(
          title: article['title']!,
          image: article['image']!,
          author: article['author']!,
          date: article['date']!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Column(
        children: [

          Container(
            width: double.infinity,
            color: const Color(0xFFE8ECF8),

            padding: const EdgeInsets.fromLTRB(
              24,
              50,
              24,
              16,
            ),

            child: const Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      'Good Morning,\nAhmed Saber',

                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      'Sun 9 April, 2023',

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                Text(
                  '☀️ Sunny 32°C',
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),

              children: [

  
                SizedBox(
                  height: 206,

                  child: PageView.builder(
                    itemCount: articles.length,

                    itemBuilder: (context, index) {

                      final article =
                          articles[index];

                      return GestureDetector(
                        onTap: () =>
                            openArticle(
                              context,
                              article,
                            ),

                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(12),

                          child: Stack(
                            fit: StackFit.expand,

                            children: [

                              // Image
                              Image.asset(
                                article['image']!,
                                width: 376,
                                height: 274,
                                fit: BoxFit.cover,
                              ),

                              // Bottom information
                              Align(
                                alignment:
                                    Alignment.bottomCenter,

                                child: Container(
                                  color: Colors.black54,

                                  padding:
                                      const EdgeInsets.all(12),

                                  child: Row(
                                    children: [

                                      Expanded(
                                        child: Text(
                                          article['title']!,

                                          maxLines: 2,

                                          overflow:
                                              TextOverflow.ellipsis,

                                          style:
                                              const TextStyle(
                                            fontSize: 14,
                                            fontWeight:
                                                FontWeight.w500,
                                            color:
                                                Colors.white,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        width: 8,
                                      ),

                                      Text(
                                        article['author']!,

                                        style:
                                            const TextStyle(
                                          fontSize: 14,
                                          fontWeight:
                                              FontWeight.w400,
                                          color:
                                              Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      'Most Popular',

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),

                    Text(
                      'See More',

                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),


                SizedBox(
                  height: 270,

                  child: ListView.builder(
                    scrollDirection:
                        Axis.horizontal,

                    itemCount: articles.length,

                    itemBuilder:
                        (context, index) {

                      final article =
                          articles[index];

                      return GestureDetector(
                        onTap: () =>
                            openArticle(
                              context,
                              article,
                            ),

                        child: Container(
                          width: 180,

                          margin:
                              const EdgeInsets.only(
                            right: 14,
                          ),

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(8),

                                child: Image.asset(
                                  article['image']!,
                                  width: 180,
                                  height: 175,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                article['title']!,

                                maxLines: 2,

                                overflow:
                                    TextOverflow.ellipsis,

                                style:
                                    const TextStyle(
                                  fontSize: 20,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                article['category']!,

                                style:
                                    const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w400,
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
            ),
          ),
        ],
      ),

      bottomNavigationBar: AppBottomNav(
        currentIndex: 0,

        onTap: _onNavTap,
      ),
    );
  }
}