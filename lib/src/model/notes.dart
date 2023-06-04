import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String idN; // Nueva propiedad id

  final String title;
  final String description;
  final bool isPublic;
  final bool isIncognito;
  final DateTime createdAt;
  final DateTime? updatedAt; // updatedAt es opcional

  String userId;
  bool isExpanded; // Nuevo campo isExpanded


  Note({
    required this.idN,

    required this.userId,
    required this.title,
    required this.description,
    required this.isPublic,
    required this.isIncognito,
    required this.createdAt,
    this.updatedAt, // updatedAt es opcional
    this.isExpanded = false, // Valor predeterminado para isExpanded


  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      idN: map['idN'] ?? '',

      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isPublic: map['isPublic'] ?? false,
      isIncognito: map['isIncognito'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null ? (map['updatedAt'] as Timestamp).toDate() : null,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'idN': idN,

      'userId': userId,
      'title': title,
      'description': description,
      'isPublic': isPublic,
      'isIncognito': isIncognito,
      'createdAt': createdAt,
      'updatedAt': updatedAt, // updatedAt es opcional
    };
  }

  static List<Note> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) {
      return Note(
        idN: map['idN'] ?? '',

        userId: map['userId'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        isPublic: map['isPublic'] ?? false,
        isIncognito: map['isIncognito'] ?? false,
        createdAt: (map['createdAt'] as Timestamp).toDate(),
        updatedAt: map['updatedAt'] != null ? (map['updatedAt'] as Timestamp).toDate() : null,
      );
    }).toList();
  }

  factory Note.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return Note(
      idN: data?['idN'] ?? '',

      userId: data?['userId'] ?? '',
      title: data?['title'] ?? '',
      description: data?['description'] ?? '',
      isPublic: data?['isPublic'] ?? false,
      isIncognito: data?['isIncognito'] ?? false,
      createdAt: (data?['createdAt'] as Timestamp).toDate(),
      updatedAt: data?['updatedAt'] != null ? (data?['updatedAt'] as Timestamp).toDate() : null,
    );
  }
}
