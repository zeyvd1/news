import 'package:flutter/material.dart';
import 'explore_screen.dart' show Article, articles, categories;

class SearchResultsScreen extends StatefulWidget {
  final String query;
  const SearchResultsScreen({super.key, required this.query});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  static const _all = 'All';
  String _selected = _all;

  @override
  Widget build(BuildContext context) {
    final q = widget.query.toLowerCase();
    final matches =
        articles.where((a) => a.title.toLowerCase().contains(q)).toList();

    final tabs = [_all, ...categories];
    int count(String c) =>
        c == _all ? matches.length : matches.where((a) => a.category == c).length;

    final visible =
        _selected == _all ? matches : matches.where((a) => a.category == _selected).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(children: [
              IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context)),
              const Expanded(
                child: Text('Search results',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 48),
            ]),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 34,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: tabs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final c = tabs[i];
                final sel = c == _selected;
                return GestureDetector(
                  onTap: () => setState(() => _selected = c),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: sel ? const Color(0xFFE3E8F7) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: sel
                              ? const Color(0xFFE3E8F7)
                              : const Color(0xFFE5E7EB)),
                    ),
                    child: Text('$c (${count(c)})',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: sel ? FontWeight.w600 : FontWeight.w500)),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: visible.isEmpty
                ? const Center(child: Text('No results found'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: visible.length,
                    itemBuilder: (_, i) => _tile(visible[i]),
                  ),
          ),
        ]),
      ),
    );
  }

  Widget _tile(Article a) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(a.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600, height: 1.3)),
                const SizedBox(height: 8),
                Row(children: [
                  _img(a.avatar, w: 20, h: 20, r: 10),
                  const SizedBox(width: 6),
                  Text('${a.author} · ${a.date}',
                      style: const TextStyle(
                          fontSize: 11, color: Color(0xFF6B7280))),
                ]),
              ],
            ),
          ),
          const SizedBox(width: 16),
          _img(a.image, w: 80, h: 58, r: 8),
        ]),
      );

  Widget _img(String path, {double? w, double? h, double r = 0}) => ClipRRect(
        borderRadius: BorderRadius.circular(r),
        child: Image.asset(path,
            width: w,
            height: h,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
                width: w, height: h, color: const Color(0xFFE3E5EA))),
      );
}
