import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String title;
  final String description;
  final bool isPublic;
  final bool isIncognito;

  Note({
    required this.title,
    required this.description,
    required this.isPublic,
    required this.isIncognito,
  });

  factory Note.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Note(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      isPublic: data['isPublic'] ?? false,
      isIncognito: data['isIncognito'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isPublic': isPublic,
      'isIncognito': isIncognito,
    };
  }

  static List<Note> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) {
      return Note(
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        isPublic: map['isPublic'] ?? false,
        isIncognito: map['isIncognito'] ?? false,
      );
    }).toList();
  }

}
