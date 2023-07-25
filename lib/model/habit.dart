// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HabitModel {
  String name;
  String description;
  bool isCompleted;
  HabitModel({
    required this.name,
    required this.description,
    this.isCompleted = false,
  });

  HabitModel copyWith({
    String? name,
    String? description,
    bool? isCompleted,
  }) {
    return HabitModel(
      name: name ?? this.name,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      name: map['name'] as String,
      description: map['description'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitModel.fromJson(String source) =>
      HabitModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HabitModel(name: $name, description: $description, isCompleted: $isCompleted)';

  @override
  bool operator ==(covariant HabitModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ isCompleted.hashCode;
}
