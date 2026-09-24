import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/constants/image_assets.dart';
import 'package:news/core/theme/app_colors.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (icon: AppIcons.navHome, label: 'Home'),
    (icon: AppIcons.navExplore, label: 'Explore'),
    (icon: AppIcons.navBookmark, label: 'Bookmark'),
    (icon: AppIcons.navWeather, label: 'Weather'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 12),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: AppColors.navBg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_items.length, (index) {
          final selected = index == currentIndex;
          final item = _items[index];
          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(
                horizontal: selected ? 16 : 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: selected ? AppColors.dark : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    item.icon,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      selected ? Colors.white : AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  if (selected) ...[
                    const SizedBox(width: 8),
                    Text(
                      item.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
