import '../datasources/project_local_datasource.dart';
import '../models/project.dart';

/// Abstract contract for the project data layer.
abstract class ProjectRepository {
  List<Project> getProjects();
}

/// Default implementation backed by the local static data source.
class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectLocalDatasource _datasource;

  const ProjectRepositoryImpl({
    required ProjectLocalDatasource datasource,
  }) : _datasource = datasource;

  @override
  List<Project> getProjects() => _datasource.getProjects();
}
