import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String? id;
  final String title;
  final String description;
  final bool isPublic;
  final bool isIncognito;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String nameN;
  final String photoN;
  List<dynamic> likes;
  String userId;
  bool isExpanded;

  Note({
     this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.isPublic,
    required this.isIncognito,
    required this.createdAt,
    this.updatedAt,
    required this.nameN,
    required this.photoN,
    this.likes = const [],
    this.isExpanded = false,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] ?? '',
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
      likes: map['likes'] ?? 0,
      isExpanded: map['isExpanded'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'isPublic': isPublic,
      'isIncognito': isIncognito,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'nameN': nameN,
      'photoN': photoN,
      'likes': likes,
      'isExpanded': isExpanded,
    };
  }

  static List<Note> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) {
      return Note(
        id: map['id'] ?? '',
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
        likes: map['likes'] ?? 0,
        isExpanded: map['isExpanded'] ?? false,
      );
    }).toList();
  }

  factory Note.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return Note(
      id: data?['id'] ?? '',
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
      likes: data?['likes'] ?? 0,
      isExpanded: data?['isExpanded'] ?? false,
    );
  }
}