import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String title;
  final String description;
  final bool isPublic;

  Note({
    required this.title,
    required this.description,
    required this.isPublic,
  });

  factory Note.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Note(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      isPublic: data['isPublic'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isPublic': isPublic,
    };
  }
}
