import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawtal/models/pet.dart';
import 'package:pawtal/theme/app_theme.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final VoidCallback onTap;

  const PetCard({
    super.key,
    required this.pet,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              AppTheme.lightGray,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with type
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryRed,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      pet.type,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '#${pet.id}',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Pet Image
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  _getPetIcon(pet.type),
                  size: 80,
                  color: _getTypeColor(pet.type),
                ),
              ),
            ),
            // Pet Info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pet.species,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatIcon(Icons.favorite, pet.happiness),
                      _buildStatIcon(Icons.restaurant, pet.hunger),
                      _buildStatIcon(Icons.bolt, pet.energy),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatIcon(IconData icon, int value) {
    Color color;
    if (value >= 70) {
      color = AppTheme.successGreen;
    } else if (value >= 40) {
      color = AppTheme.warningOrange;
    } else {
      color = AppTheme.primaryRed;
    }

    return Tooltip(
      message: '$value%',
      child: Icon(icon, size: 20, color: color),
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

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'electric':
        return AppTheme.electricYellow;
      case 'water':
        return AppTheme.waterBlue;
      case 'fire':
        return AppTheme.fireRed;
      default:
        return AppTheme.primaryBlue;
    }
  }
}
