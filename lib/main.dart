import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const ActorPortfolioApp());
}

class ActorPortfolioApp extends StatelessWidget {
  const ActorPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actor Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF111111),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  List<String> get galleryImages => const [
    'assets/images/foto1.jpg',
    'assets/images/foto2.jpg',
    'assets/images/foto3.jpg',
    'assets/images/foto4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final crossAxisCount = width > 1100
        ? 4
        : width > 800
        ? 3
        : 2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const _Header(),
            const SizedBox(height: 24),
            const _HeroSection(),
            const SizedBox(height: 32),
            const _SectionTitle('Reel'),
            const SizedBox(height: 16),
            const SizedBox(
              height: 320,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: VideoSection(
                  assetPath: 'assets/images/video.mp4',
                ),
              ),
            ),
            const SizedBox(height: 40),
            const _SectionTitle('Book de fotos'),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: galleryImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final path = galleryImages[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      path,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            const _SectionTitle('Sobre mí'),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Texto corto de biografía. Quién eres, tu formación y '
                    'qué tipo de trabajos te interesan.',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            const _SectionTitle('Contacto'),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Email: tuemail@ejemplo.com\n'
                    'Teléfono: +34 600 000 000\n'
                    'Ciudad base: Málaga / Madrid',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 8),
            const Text(
              '© 2025 Tu Nombre',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          const Text(
            'Tu Nombre',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          TextButton(onPressed: () {}, child: const Text('Reel')),
          TextButton(onPressed: () {}, child: const Text('Book')),
          TextButton(onPressed: () {}, child: const Text('Sobre mí')),
          TextButton(onPressed: () {}, child: const Text('Contacto')),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 800;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: isWide
          ? Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Tu Nombre',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Actriz / Modelo / Creadora',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Una frase de presentación en dos o tres líneas.',
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          SizedBox(
            width: 260,
            height: 340,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/foto_portada.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      )
          : Column(
        children: [
          SizedBox(
            width: 260,
            height: 340,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/foto_portada.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Tu Nombre',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Actriz / Modelo / Creadora',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class VideoSection extends StatefulWidget {
  final String assetPath;
  const VideoSection({super.key, required this.assetPath});

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        setState(() {
          _initialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: FloatingActionButton.small(
            onPressed: _togglePlay,
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ),
      ],
    );
  }
}
