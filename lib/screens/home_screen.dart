import 'package:flutter/material.dart';
import 'package:pawtal/models/pet.dart';
import 'package:pawtal/screens/pet_details_screen.dart';
import 'package:pawtal/theme/app_theme.dart';
import 'package:pawtal/widgets/pet_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Pet> _pets = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pets = Pet.getSamplePets();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppTheme.pokeballBackground(),
        child: Column(
          children: [
            // Custom App Bar with Pokédex style
            Container(
              padding: const EdgeInsets.only(
                  top: 48, left: 20, right: 20, bottom: 16),
              decoration: BoxDecoration(
                color: AppTheme.primaryRed,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'PETDEX',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search your pet...',
                        prefixIcon: const Icon(Icons.search,
                            color: AppTheme.primaryBlue),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Stats Summary
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatChip(Icons.bolt, 'Total', _pets.length.toString()),
                  _buildStatChip(Icons.emoji_events, 'Level', '15'),
                  _buildStatChip(Icons.stars, 'Achievements', '8'),
                ],
              ),
            ),
            // Tabs
            TabBar(
              controller: _tabController,
              labelColor: AppTheme.primaryRed,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppTheme.primaryRed,
              tabs: const [
                Tab(icon: Icon(Icons.pets), text: 'My Pets'),
                Tab(icon: Icon(Icons.explore), text: 'Discover'),
                Tab(icon: Icon(Icons.emoji_events), text: 'Rankings'),
              ],
            ),
            // Pet Grid
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildPetGrid(),
                  _buildDiscoverTab(),
                  _buildRankingsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatChip(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.primaryBlue, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkBlue,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildPetGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _pets.length,
      itemBuilder: (context, index) {
        return PetCard(
          pet: _pets[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PetDetailsScreen(pet: _pets[index]),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDiscoverTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'Discover new pets!',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Complete quests to unlock new companions',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankingsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.emoji_events, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'Leaderboard Coming Soon!',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Compete with friends and rise to the top',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
