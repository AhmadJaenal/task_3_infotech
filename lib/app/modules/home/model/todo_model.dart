import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String description;
  final String category;
  final Color color;
  final DateTime date;
  final bool isCompleted;

  TaskModel({
    required this.id,
    required this.description,
    required this.category,
    required this.color,
    required this.date,
    this.isCompleted = false,
  });

  TaskModel copyWith({
    String? description,
    String? category,
    Color? color,
    DateTime? date,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id,
      description: description ?? this.description,
      category: category ?? this.category,
      color: color ?? this.color,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
