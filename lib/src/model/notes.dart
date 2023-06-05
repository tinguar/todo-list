import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String title;
  final String description;
  final bool isPublic;
  final bool isIncognito;
  final DateTime createdAt;
  final DateTime? updatedAt; // updatedAt es opcional
  final String nameN;
  final String photoN;

  String userId;
  bool isExpanded; // Nuevo campo isExpanded

  Note({
    required this.userId,
    required this.title,
    required this.description,
    required this.isPublic,
    required this.isIncognito,
    required this.createdAt,
    this.updatedAt, // updatedAt es opcional
    required this.nameN, // updatedAt es opcional
    required this.photoN, // updatedAt es opcional
    this.isExpanded = false, // Valor predeterminado para isExpanded
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isPublic: map['isPublic'] ?? false,
      isIncognito: map['isIncognito'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      nameN: map['nameN'] ?? '',
      photoN: map['photoN'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'isPublic': isPublic,
      'isIncognito': isIncognito,
      'createdAt': createdAt,
      'updatedAt': updatedAt, // updatedAt es opcional
      'nameN': nameN, // updatedAt es opcional
      'photoN': photoN, // updatedAt es opcional
    };
  }

  static List<Note> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) {
      return Note(
        userId: map['userId'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        isPublic: map['isPublic'] ?? false,
        isIncognito: map['isIncognito'] ?? false,
        createdAt: (map['createdAt'] as Timestamp).toDate(),
        updatedAt: map['updatedAt'] != null
            ? (map['updatedAt'] as Timestamp).toDate()
            : null,
        nameN: map['nameN'] ?? '',
        photoN: map['photoN'] ?? '',
      );
    }).toList();
  }

  factory Note.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return Note(
      userId: data?['userId'] ?? '',
      title: data?['title'] ?? '',
      description: data?['description'] ?? '',
      isPublic: data?['isPublic'] ?? false,
      isIncognito: data?['isIncognito'] ?? false,
      createdAt: (data?['createdAt'] as Timestamp).toDate(),
      updatedAt: data?['updatedAt'] != null
          ? (data?['updatedAt'] as Timestamp).toDate()
          : null,
      nameN: data?['nameN'] ?? '',
      photoN: data?['photoN'] ?? '',
    );
  }
}
