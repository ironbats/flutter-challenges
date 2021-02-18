import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


  Future<List<SearchResult>> callApiSoftSkills() async {
    final response =
        await http.get("http://10.0.2.2:8086/flutter/get-all-skills");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var responseJson = json.decode(response.body);
      return (responseJson as List)
          .map((p) => SearchResult.fromJson(p))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load server data');
    }
  }



class SearchResult {

  final List<SearchResult> items;
  final String id;
  final String name;
  final String cargo;
  final String project;
  final String skills;
  

  const SearchResult(
      {this.id, this.name, this.cargo, this.project, this.skills, this.items});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
        id: json['id'],
        name: json['name'],
        cargo: json['cargo'],
        project: json['project'],
        skills: json['skills']);
  }



  String toString() {
    return "Nome [" +
        name +
        "]" +
        " Cargo [" +
        cargo +
        "]" +
        " Projeto [" +
        project +
        "]" +
        " SoftSkills [" +
        skills +
        "]";
  }
}

class SoftSkills {
  final String name;
  final String cargo;
  final String project;
  final String skills;
  final List<SearchResult> items;

  SoftSkills({this.name, this.cargo, this.project, this.skills,this.items});

  factory SoftSkills.fromJson(Map<String, dynamic> json) {
    return SoftSkills(
        name: json["name"] as String,
        cargo: json["cargo"] as String,
        project: json["project"] as String,
        skills: json["skills"] as String);
  }
}
