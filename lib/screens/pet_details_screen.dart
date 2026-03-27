import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawtal/models/pet.dart';
import 'package:pawtal/theme/app_theme.dart';
import 'package:pawtal/widgets/stat_bar.dart';

class PetDetailsScreen extends StatefulWidget {
  final Pet pet;

  const PetDetailsScreen({super.key, required this.pet});

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen>
    with SingleTickerProviderStateMixin {
  late Pet _pet;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pet = widget.pet;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _feedPet() {
    setState(() {
      _pet = _pet.copyWith(
        hunger: (_pet.hunger + 20).clamp(0, 100),
        happiness: (_pet.happiness + 5).clamp(0, 100),
      );
    });
    _showActionSnackbar('🍖 You fed ${_pet.name}! +20 Hunger, +5 Happiness');
  }

  void _playWithPet() {
    setState(() {
      _pet = _pet.copyWith(
        happiness: (_pet.happiness + 15).clamp(0, 100),
        energy: (_pet.energy - 10).clamp(0, 100),
      );
    });
    _showActionSnackbar(
        '🎾 You played with ${_pet.name}! +15 Happiness, -10 Energy');
  }

  void _healPet() {
    setState(() {
      _pet = _pet.copyWith(
        energy: (_pet.energy + 25).clamp(0, 100),
        happiness: (_pet.happiness + 10).clamp(0, 100),
      );
    });
    _showActionSnackbar(
        '💊 You healed ${_pet.name}! +25 Energy, +10 Happiness');
  }

  void _showActionSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.successGreen,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppTheme.primaryRed,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.primaryRed,
                      AppTheme.primaryBlue,
                    ],
                  ),
                ),
                child: Center(
                  child: AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _getPetIcon(_pet.type),
                            size: 100,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              title: Text(
                _pet.name,
                style: GoogleFonts.pressStart2p(fontSize: 16),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Type and ID
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: AppTheme.typeCardDecoration(_pet.type),
                        child: Text(
                          _pet.type,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '#${_pet.id}',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Species and Description
                  Text(
                    _pet.species,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _pet.description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Stats Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.insights,
                                color: AppTheme.primaryBlue),
                            const SizedBox(width: 8),
                            Text(
                              'PET STATS',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.darkBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        StatBar(
                          label: 'Happiness',
                          value: _pet.happiness,
                          icon: Icons.favorite,
                          color: Colors.pink,
                        ),
                        const SizedBox(height: 12),
                        StatBar(
                          label: 'Hunger',
                          value: _pet.hunger,
                          icon: Icons.restaurant,
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 12),
                        StatBar(
                          label: 'Energy',
                          value: _pet.energy,
                          icon: Icons.bolt,
                          color: Colors.amber,
                        ),
                        const SizedBox(height: 12),
                        StatBar(
                          label: 'Level',
                          value: _pet.level * 10,
                          icon: Icons.emoji_events,
                          color: AppTheme.secondaryYellow,
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: _pet.exp / (_pet.level * 100),
                          backgroundColor: Colors.grey[200],
                          valueColor: const AlwaysStoppedAnimation(
                              AppTheme.successGreen),
                          minHeight: 8,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'EXP: ${_pet.exp}/${_pet.level * 100}',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              'Next Level: ${_pet.level + 1}',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Evolution Chain
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.timeline,
                                color: AppTheme.primaryBlue),
                            const SizedBox(width: 8),
                            Text(
                              'EVOLUTION CHAIN',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.darkBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _pet.evolutionChain.map((evolution) {
                            bool isCurrent = evolution == _pet.name;
                            return Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: isCurrent
                                        ? AppTheme.primaryRed.withOpacity(0.2)
                                        : Colors.grey[200],
                                    shape: BoxShape.circle,
                                    border: isCurrent
                                        ? Border.all(
                                            color: AppTheme.primaryRed,
                                            width: 2,
                                          )
                                        : null,
                                  ),
                                  child: Icon(
                                    Icons.pets,
                                    size: 30,
                                    color: isCurrent
                                        ? AppTheme.primaryRed
                                        : Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  evolution,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: isCurrent
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isCurrent
                                        ? AppTheme.primaryRed
                                        : Colors.grey[600],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          icon: Icons.restaurant,
                          label: 'Feed',
                          color: Colors.orange,
                          onTap: _feedPet,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildActionButton(
                          icon: Icons.sports_esports,
                          label: 'Play',
                          color: Colors.green,
                          onTap: _playWithPet,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildActionButton(
                          icon: Icons.healing,
                          label: 'Heal',
                          color: Colors.blue,
                          onTap: _healPet,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24, color: Colors.white),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getPetIcon(String type) {
    switch (type.toLowerCase()) {
      case 'electric':
        return Icons.bolt;
      case 'water':
        return Icons.water_drop;
      case 'fire':
        return Icons.local_fire_department;
      default:
        return Icons.pets;
    }
  }
}
