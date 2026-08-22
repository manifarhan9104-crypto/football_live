import 'package:flutter/material.dart';

void main() {
  runApp(const FootballLiveApp());
}

class FootballLiveApp extends StatelessWidget {
  const FootballLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'football_live',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F14),
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00D26A),
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildHomeContent(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFF00D26A),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.sports_soccer,
              color: Colors.black,
              size: 27,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'football_live',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'نتایج زنده فوتبال',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
      children: [
        _sectionTitle('🔴 بازی‌های زنده'),
        const SizedBox(height: 10),
        _liveMatchCard(),
        const SizedBox(height: 24),
        _sectionTitle('📅 بازی‌های امروز'),
        const SizedBox(height: 10),
        _matchCard(
          league: 'لیگ برتر ایران',
          home: 'پرسپولیس',
          away: 'استقلال',
          homeScore: '2',
          awayScore: '1',
          time: '20:00',
          status: '66\'',
        ),
        const SizedBox(height: 10),
        _matchCard(
          league: 'Premier League',
          home: 'Arsenal',
          away: 'Chelsea',
          homeScore: '-',
          awayScore: '-',
          time: '22:30',
          status: 'آینده',
        ),
        const SizedBox(height: 24),
        _sectionTitle('📰 آخرین اخبار'),
        const SizedBox(height: 10),
        _newsCard(
          'آخرین اخبار فوتبال ایران و جهان',
          'اخبار و حواشی مهم فوتبال',
        ),
        const SizedBox(height: 10),
        _newsCard(
          'نقل‌وانتقالات داغ فوتبال',
          'جدیدترین اخبار بازار نقل‌وانتقالات',
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _liveMatchCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF12251B),
            Color(0xFF10161C),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFF00D26A).withOpacity(0.35),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.red,
                      size: 8,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'LIVE',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'لیگ برتر ایران',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _team(
                  'پرسپولیس',
                  Icons.shield,
                ),
              ),
              const Column(
                children: [
                  Text(
                    '2  -  1',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "66'",
                    style: TextStyle(
                      color: Color(0xFF00D26A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: _team(
                  'استقلال',
                  Icons.shield_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00D26A),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'مشاهده جزئیات بازی',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _team(String name, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          size: 42,
          color: Colors.white70,
        ),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _matchCard({
    required String league,
    required String home,
    required String away,
    required String homeScore,
    required String awayScore,
    required String time,
    required String status,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF121820),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  league,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                ),
              ),
              Text(
                status,
                style: const TextStyle(
                  color: Color(0xFF00D26A),
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Text(
                  home,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    '$homeScore  -  $awayScore',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  away,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _newsCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF121820),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: const Color(0xFF1B252E),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.article_outlined,
              color: Color(0xFF00D26A),
              size: 30,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return NavigationBar(
      backgroundColor: const Color(0xFF10151B),
      indicatorColor: const Color(0xFF00D26A).withOpacity(0.18),
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'خانه',
        ),
        NavigationDestination(
          icon: Icon(Icons.sports_soccer_outlined),
          selectedIcon: Icon(Icons.sports_soccer),
          label: 'زنده',
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_month_outlined),
          selectedIcon: Icon(Icons.calendar_month),
          label: 'بازی‌ها',
        ),
        NavigationDestination(
          icon: Icon(Icons.newspaper_outlined),
          selectedIcon: Icon(Icons.newspaper),
          label: 'اخبار',
        ),
      ],
    );
  }
}
