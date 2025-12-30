import 'package:flutter/material.dart';

class MusicOfTheDaySection extends StatelessWidget {
  const MusicOfTheDaySection({super.key});

  final List<Map<String, String>> musicList = const [
    {
      'title': 'Ayun Buai Zaman',
      'artist': 'Fstvlst',
      'imagePath': 'assets/images/hits.jpg'
    },
    {
      'title': 'Puritan (God Blessed Fascists)',
      'artist': 'Homicide',
      'imagePath': 'assets/images/homi.jpeg'
    },
    {
      'title': 'Rima Ababil',
      'artist': 'Homicide',
      'imagePath': 'assets/images/rima.jpg'
    },
    {
      'title': '33x',
      'artist': 'Perunggu',
      'imagePath': 'assets/images/perunggu.jpg'
    },
    {
      'title': 'Orang-orang di kerumunan',
      'artist': 'Fstvlst',
      'imagePath': 'assets/images/hits.jpg'
    },
    {
      'title': 'kalibata (2012)',
      'artist': 'Perunggu',
      'imagePath': 'assets/images/perunggu.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Music Of The Day',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 9),
        SizedBox(
          height: 400,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: musicList.length,
            itemBuilder: (context, index) {
              final music = musicList[index];
              return MusicCard(
                title: music['title']!,
                artist: music['artist']!,
                imagePath: music['imagePath']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class MusicCard extends StatefulWidget {
  final String title;
  final String artist;
  final String imagePath;

  const MusicCard({
    super.key,
    required this.title,
    required this.artist,
    required this.imagePath,
  });

  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? ' ${widget.title} Ditambahkan ke favorite'
              : ' ${widget.title} dihapus dari favorite!',
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: isFavorite ? const Color(0xFFB72024) : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.imagePath,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  widget.artist,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: toggleFavorite,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? const Color(0xFFB72024) : Colors.grey,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}