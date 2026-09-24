import 'package:flutter/material.dart';
import 'package:news/core/constants/image_assets.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/widgets/app_bottom_nav.dart';
import 'package:news/features/explore/view/explore_screen.dart';
import 'package:news/features/home/view/home_screen.dart';
import 'package:news/features/weather/view/weather_screen.dart';

class BookmarkItem {
  final String id;
  final String title;
  final String category;
  final String image;

  BookmarkItem({
    required this.id,
    required this.title,
    required this.category,
    required this.image,
  });
}

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final List<BookmarkItem> _bookmarks = [
    BookmarkItem(
      id: '1',
      title: 'How to Setup Your \nWorksapce',
      category: 'Interior',
      image: AppImages.im1,
    ),
    BookmarkItem(
      id: '2',
      title: 'Discovering Hidden Gems:\n 8 Off-The-Beaten-Path',
      category: 'Travel',
      image: AppImages.im2,
    ),
    BookmarkItem(
      id: '3',
      title: 'Exploring the World\'s Best\n Beaches: Top 5 Picks',
      category: 'Travel',
      image: AppImages.im3,
    ),
    BookmarkItem(
      id: '4',
      title: 'Travel Destinations That\n Won\'t Break the Bank',
      category: 'Travel',
      image: AppImages.im4,
    ),
    BookmarkItem(
      id: '5',
      title: 'How Working Remotely\n Will Make You More Happy',
      category: 'Business',
      image: AppImages.im5,
    ),
    BookmarkItem(
      id: '6',
      title: 'Destinations for Authentic Local Experiences',
      category: 'Business',
      image: AppImages.im6,
    ),
    BookmarkItem(
      id: '7',
      title: 'A Guide to Seasonal\n Gardening',
      category: 'Travel',
      image: AppImages.im7,
    ),
  ];

  void _onNavTap(int index) {
    if (index == 2) return;

    Widget screen;

    switch (index) {
      case 0:
        screen = const HomeScreen();
        break;
      case 1:
        screen = const ExploreScreen();
        break;
      default:
        screen = const WeatherScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  Future<bool> _confirmDelete(BookmarkItem item) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Sure You want to delete this item?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          item.category,
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        
                      ],
                    ),
                    
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      item.image,
                      width: 112,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pop(dialogContext, true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Yes, Delete',
                        style: TextStyle(color: Colors.white , fontSize: 15 , fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: OutlinedButton(
                      onPressed: () =>
                          Navigator.pop(dialogContext, false),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.primary,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'No',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 15 , fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 123,
            width: double.infinity,
            color: AppColors.headerBg,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  const Text(
                    'Bookmark',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
      
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
               
              ),
              child: _bookmarks.isEmpty
                  ? const Center(
                      child: Text(
                        'No Bookmarks Yet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        20,
                        20,
                        100,
                      ),
                      itemCount: _bookmarks.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final item = _bookmarks[index];
      
                        return Dismissible(
                          key: ValueKey(item.id),
                          direction:
                              DismissDirection.endToStart,
                          confirmDismiss: (_) =>
                              _confirmDelete(item),
                          onDismissed: (_) {
                            setState(() {
                              _bookmarks.removeAt(index);
                            });
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding:
                                const EdgeInsets.only(right: 20),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      maxLines: 2,
                                      overflow:
                                          TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight:
                                            FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.category,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
      
                              const SizedBox(width: 12),
      
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(12),
                                child: Image.asset(
                                  item.image,
                                  width: 112,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 2,
        onTap: _onNavTap,
      ),
    );
  }
}