import 'dart:convert';

class TodoModel {
  final int id;
  final String title;
  final String description;
  final DateTime created;
  final DateTime updated;

  TodoModel({
    required this.id, 
    required this.title, 
    required this.description,
    required this.created,
    required this.updated
  });

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      created: DateTime.parse(map['created']),
      updated: DateTime.parse(map['updated'])
    );
  }

  factory TodoModel.fromJson(String json) => TodoModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String()
    };
  }

  String toJson() => jsonEncode(toMap());

  TodoModel copyWith({
    String? title, 
    String? description,
    DateTime? updated
  }) {
    return TodoModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      created: created,
      updated: updated ?? this.updated
    );
  }
}