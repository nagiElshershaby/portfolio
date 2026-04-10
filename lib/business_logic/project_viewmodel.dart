import 'package:flutter/material.dart';
import '../data/models/project.dart';
import '../data/repositories/project_repository.dart';

/// Provides the projects list to the UI layer.
/// Presentation state (current page, PageController) stays in the screen.
class ProjectViewModel extends ChangeNotifier {
  final ProjectRepository _repository;

  late final List<Project> _projects;

  ProjectViewModel({required ProjectRepository repository})
      : _repository = repository {
    _projects = _repository.getProjects();
  }

  List<Project> get projects => _projects;

  int get count => _projects.length;
}
