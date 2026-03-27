class Pet {
  final String id;
  final String name;
  final String species;
  final String type;
  final String description;
  final String imageAsset;
  final int happiness;
  final int hunger;
  final int energy;
  final int level;
  final int exp;
  final List<String> evolutionChain;

  Pet({
    required this.id,
    required this.name,
    required this.species,
    required this.type,
    required this.description,
    required this.imageAsset,
    required this.happiness,
    required this.hunger,
    required this.energy,
    required this.level,
    required this.exp,
    required this.evolutionChain,
  });

  Pet copyWith({
    String? id,
    String? name,
    String? species,
    String? type,
    String? description,
    String? imageAsset,
    int? happiness,
    int? hunger,
    int? energy,
    int? level,
    int? exp,
    List<String>? evolutionChain,
  }) {
    return Pet(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      type: type ?? this.type,
      description: description ?? this.description,
      imageAsset: imageAsset ?? this.imageAsset,
      happiness: happiness ?? this.happiness,
      hunger: hunger ?? this.hunger,
      energy: energy ?? this.energy,
      level: level ?? this.level,
      exp: exp ?? this.exp,
      evolutionChain: evolutionChain ?? this.evolutionChain,
    );
  }

  // Sample data for demonstration
  static List<Pet> getSamplePets() {
    return [
      Pet(
        id: '001',
        name: 'Sparky',
        species: 'Electric Pup',
        type: 'Electric',
        description: 'A energetic pet that loves to play and needs regular exercise. Its fur crackles with static electricity when happy!',
        imageAsset: 'assets/images/sparky.png',
        happiness: 85,
        hunger: 60,
        energy: 90,
        level: 5,
        exp: 120,
        evolutionChain: ['Sparky', 'Thunder Hound', 'Storm Beast'],
      ),
      Pet(
        id: '002',
        name: 'Aqua',
        species: 'Water Sprite',
        type: 'Water',
        description: 'A gentle water-type pet that loves to swim and needs clean water daily. Very soothing presence!',
        imageAsset: 'assets/images/aqua.png',
        happiness: 70,
        hunger: 45,
        energy: 75,
        level: 3,
        exp: 80,
        evolutionChain: ['Aqua', 'Wave Serpent', 'Ocean Lord'],
      ),
      Pet(
        id: '003',
        name: 'Flare',
        species: 'Fire Kitten',
        type: 'Fire',
        description: 'A fiery companion that needs warmth and attention. Loves playing with fire toys!',
        imageAsset: 'assets/images/flare.png',
        happiness: 95,
        hunger: 80,
        energy: 65,
        level: 7,
        exp: 210,
        evolutionChain: ['Flare', 'Inferno Cat', 'Phoenix Beast'],
      ),
    ];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'species': species,
    'type': type,
    'description': description,
    'imageAsset': imageAsset,
    'happiness': happiness,
    'hunger': hunger,
    'energy': energy,
    'level': level,
    'exp': exp,
    'evolutionChain': evolutionChain,
  };

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      name: json['name'],
      species: json['species'],
      type: json['type'],
      description: json['description'],
      imageAsset: json['imageAsset'],
      happiness: json['happiness'],
      hunger: json['hunger'],
      energy: json['energy'],
      level: json['level'],
      exp: json['exp'],
      evolutionChain: List<String>.from(json['evolutionChain']),
    );
  }
}
