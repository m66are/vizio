class Feeling {
  String nom;
  num valeur;
  bool isPositive;
  Feeling({
    required this.nom,
    required this.isPositive,
    required this.valeur,
  });

  Feeling copyWith({
    String? nom,
    String? imageUrl,
  }) {
    return Feeling(
      nom: nom ?? this.nom,
      isPositive: isPositive ?? isPositive,
      valeur: valeur ?? valeur,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'imageUrl': valeur,
    };
  }

  factory Feeling.fromMap(dynamic map, String key) {
    return Feeling(
      nom: key,
      isPositive: map["positive"],
      valeur: map['val'] ?? '',
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Feeling.fromJson(String source) =>
  //     Feeling.fromMap(json.decode(source));

  @override
  String toString() => 'Veg(nom: $nom, imageUrl: $valeur)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Feeling && other.nom == nom && other.valeur == valeur;
  }

  @override
  int get hashCode => nom.hashCode ^ valeur.hashCode;
}
