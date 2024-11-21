
import 'package:hive/hive.dart';

part 'upload.g.dart';

@HiveType(typeId: 2)
class Upload extends HiveObject {
  @HiveField(0)
  String filepath;

  Upload({required this.filepath});

  factory Upload.fromJson(Map<String, dynamic> json) => Upload(
    filepath: json['filepath'],
  );
}
