import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocalBookModel {
  LocalBookModel({
    required this.filePath,
    required this.filenameWithExtension,
    required this.title,
    required this.type,
    this.author,
    this.coverImagePath,
  });

  final String filePath;
  final String filenameWithExtension;
  final String? author;
  final String title;
  final String? coverImagePath;
  final BookType type;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'filePath': filePath,
      'filenameWithExtension': filenameWithExtension,
      'author': author,
      'title': title,
      'type': type.name,
      'coverImagePath': coverImagePath,
    };
  }

  factory LocalBookModel.fromMap(Map<String, dynamic> map) {
    return LocalBookModel(
      filePath: (map['filePath'] ?? '') as String,
      filenameWithExtension: (map['filenameWithExtension'] ?? '') as String,
      author: (map['author']) as String?,
      title: (map['title'] ?? '') as String,
      type: BookType.values.byName((map['type'] ?? 'epub') as String),
      coverImagePath: (map['coverImagePath']) as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalBookModel.fromJson(String source) =>
      LocalBookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  LocalBookModel copyWith({
    String? bookId,
    String? coverUrl,
    String? filePath,
    String? filenameWithExtension,
    String? author,
    String? title,
    BookType? type,
    String? coverImagePath,
  }) {
    return LocalBookModel(
      filePath: filePath ?? this.filePath,
      filenameWithExtension:
          filenameWithExtension ?? this.filenameWithExtension,
      author: author ?? this.author,
      title: title ?? this.title,
      type: type ?? this.type,
      coverImagePath: coverImagePath ?? this.coverImagePath,
    );
  }
}

enum BookType {
  pdf,
  epub,
}
