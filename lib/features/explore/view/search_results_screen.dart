import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';

class SearchItem {
  final String title;
  final String category;

  SearchItem({
    required this.title,
    required this.category,
  });
}

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({
    super.key,
    required this.query,
  });

  final String query;

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  String _filter = 'All';

  final List<SearchItem> results = [
    SearchItem(
      title: 'Exploring the World\'s Best Beaches',
      category: 'Travel',
    ),
    SearchItem(
      title: 'Discovering Hidden Gems Around The World',
      category: 'Travel',
    ),
    SearchItem(
      title: 'The Future of Artificial Intelligence',
      category: 'Technology',
    ),
    SearchItem(
      title: 'Top Mobile Development Trends',
      category: 'Technology',
    ),
    SearchItem(
      title: 'How to Setup Your Workspace',
      category: 'Business',
    ),
    SearchItem(
      title: 'Remote Work is Changing the Future',
      category: 'Business',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _filter == 'All'
        ? results
        : results.where((item) => item.category == _filter).toList();

    final categories = {
      'All': results.length,
      'Travel': results.where((e) => e.category == 'Travel').length,
      'Technology': results.where((e) => e.category == 'Technology').length,
      'Business': results.where((e) => e.category == 'Business').length,
    };

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Search Results',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 42,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: categories.entries.map((entry) {
                final selected = entry.key == _filter;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _filter = entry.key;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.primary
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        '${entry.key} (${entry.value})',
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final item = filtered[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
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
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        item.category,
                        style: const TextStyle(
                          color: AppColors.grey,
                          fontSize: 13,
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
    );
  }
}