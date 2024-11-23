import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/module.dart';
import '../model/subject.dart';
import '../model/video.dart';

class ApiService {
  static const String baseUrl = 'https://trogon.info/interview/php/api/';

  // Fetch all subjects
  Future<List<Subject>> getSubjects() async {
    final response = await http.get(Uri.parse('${baseUrl}subjects.php'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Subject.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load subjects');
    }
  }

  // Fetch modules by subject id
  Future<List<Module>> getModules(int subjectId) async {
    final response = await http.get(Uri.parse('${baseUrl}modules.php?subject_id=$subjectId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Module.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load modules');
    }
  }

  // Fetch videos by module id
  Future<List<Video>> getVideos(int moduleId) async {
    final response = await http.get(Uri.parse('${baseUrl}videos.php?module_id=$moduleId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Video.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
