import 'package:flutter/material.dart';

class BandOfTheDaySection extends StatelessWidget {
  const BandOfTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Band Of The Day',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: const [
              BandCard(
                title: 'Perunggu',
                subtitle: 'Band Pulang ngantor',
                imagePath: 'assets/images/perunggu.jpg',
                isClickable: true,
              ),
              SizedBox(width: 16),
              BandCard(
                title: 'FSTVLST',
                subtitle: 'Almost Rock Bararely Art',
                imagePath: 'assets/images/farid.jpeg',
                isClickable: true,
              ),
              SizedBox(width: 16),
              BandCard(
                title: 'Homicide',
                subtitle: 'Against Neo-Liberalism',
                imagePath: 'assets/images/homicide.jpg',
                isClickable: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BandCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imagePath;
  final bool isClickable;

  const BandCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.imagePath,
    required this.isClickable,
  });

  void _showBandBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BandBottomSheet(
        bandName: title,
        bandSubtitle: subtitle,
        imagePath: imagePath,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isClickable ? () => _showBandBottomSheet(context) : null,
      child: Container(
        width: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[800]!, Colors.grey[900]!],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[700],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imagePath != null
                    ? Image.asset(
                  imagePath!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.grey[600]?.withOpacity(0.5),
                      child: const Icon(
                        Icons.music_note,
                        color: Colors.white,
                        size: 50,
                      ),
                    );
                  },
                )
                    : Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey[600]?.withOpacity(0.5),
                  child: const Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x004D4545),
                    Color(0x334D4545),
                    Color(0x664D4545),
                  ],
                  stops: [0.0, 0.6, 1.0],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 12,
              right: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BandBottomSheet extends StatelessWidget {
  final String bandName;
  final String bandSubtitle;
  final String? imagePath;

  const BandBottomSheet({
    super.key,
    required this.bandName,
    required this.bandSubtitle,
    this.imagePath,
  });

  Map<String, Map<String, dynamic>> get bandsData => {
    'Perunggu': {
      'stats': '24 song 5 albums',
      'topSong': '33x',
      'topSongImage': 'assets/images/perunggu.jpg',
      'about':
      'Perunggu, formed in 2019 by Adam Adenan (bass, vocals), Ildo Hasman (drums, vocals), and Maul Ibrahim (vocals, guitar), began as a spontaneous musical collaboration. Their 2020 EP \'Pendar, more a personal memento than a commercial endeavor, reflected their humble approach amidst other life responsibilities, including Adam\'s master\'s studies in the UK.',
      'image': 'assets/images/perunggu.jpg',
      'groupImage': 'assets/images/group_perunggu.jpg',
    },
    'FSTVLST': {
      'stats': '18 song 3 albums',
      'topSong': 'Opus',
      'topSongImage': 'assets/images/hits.jpg',
      'about':
      'Sirin Farid Stevy - Vocal, Roby Setiawan - Guitar, Humam Mufid Arifin Bass, Danis Wisnu Nugraha - Drum, dengan additional Tama Mahdi - Keyboard, dan Fandi Kurniawan - Gitar, FSTVLST mengusung sebuah genre bebas ciptaan sendiri yang bukan hanya untuk menyebut, tapi lebih sebagai sebuah kesimpulan terhadap apapun yang dikaryakan dalam band ini, bernama "Almost Rock Barely Art".',
      'image': 'assets/images/farid.jpeg',
      'groupImage': 'assets/images/farid.jpeg',
    },
    'Homicide': {
      'stats': '15 song 2 albums',
      'topSong': 'Rima Ababil',
      'topSongImage': 'assets/images/rima.jpg',
      'about':
      'Ucok Herry Sutresna – Vocal, Sarkasz – Vocal, DJ E – Turntable, Andre – Guitar, dengan additional beberapa kolaborator dari skena hip-hop dan punk lokal. Homicide mengusung hip-hop underground dengan warna khas yang dipenuhi kritik sosial, politik, dan perlawanan terhadap penindasan. Mereka menamai pendekatan musikal dan ideologisnya sebagai sebuah bentuk "perlawanan sonik" yang tak hanya menjadi label genre, tetapi juga kesimpulan dari setiap karya yang mereka lahirkan — sebuah ledakan suara yang lahir dari jalanan, kemarahan, dan kesadaran kolektif.',
      'image': 'assets/images/homicide.jpg',
      'groupImage': 'assets/images/homicide.jpg',
    },
  };

  Map<String, dynamic> get currentBandData =>
      bandsData[bandName] ?? bandsData['Perunggu']!;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Band Profile Photo
                      Center(
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey[300],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              currentBandData['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[400],
                                  child: const Icon(
                                    Icons.music_note,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Band Name
                      Center(
                        child: Text(
                          bandName,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Band Subtitle
                      Center(
                        child: Text(
                          bandSubtitle,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Stats
                      Center(
                        child: Text(
                          currentBandData['stats'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Top Song Section
                      const Text(
                        'Top Song',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Top Song Card
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey[300],
                              child: Image.asset(
                                currentBandData['topSongImage'] ??
                                    currentBandData['image'],
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[400],
                                    child: const Icon(
                                      Icons.music_note,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentBandData['topSong'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  bandName,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // About Section
                      Text(
                        'About $bandName',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // About Text
                      Text(
                        currentBandData['about'],
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}