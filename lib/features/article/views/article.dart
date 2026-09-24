import 'package:flutter/material.dart';



class ArticleScreen extends StatefulWidget {
  final String title;
  final String image;
  final String author;
  final String date;

  const ArticleScreen({
    super.key,
    required this.title,
    required this.image,
    required this.author,
    required this.date,
  });

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool saved = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            widget.image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250),

                Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF7F0F0),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          saved ? Icons.bookmark : Icons.bookmark_border,
                        ),
                        onPressed: () {
                          setState(() {
                            saved = !saved; 
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${widget.author} · ${widget.date}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Forests are one of the most important natural resources that '
                        'our planet possesses. Not only do they provide us with a diverse '
                        'range of products such as timber, medicine, and food, but they '
                        'also play a vital role in mitigating climate change and '
                        'maintaining the overall health of our planet\'s ecosystems.\n\n'
                        'One of the most important roles that forests play is in absorbing '
                        'carbon dioxide from the atmosphere. Trees absorb carbon dioxide '
                        'through photosynthesis and store it in their trunks, branches, '
                        'and leaves.',
                        style: TextStyle(fontSize: 16, height: 1.7),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}