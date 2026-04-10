class Project {
  final String? name;
  final String? description;
  final String? backgroundUrl;
  final String? googlePlay;
  final String? appStore;
  final String? github;
  final String? iconUrl;
  final String? type;
  final List<String>? features;
  final List<String>? pubspec;
  final String? notes;
  final String? lastUpdate;
  final String? status;
  final List<String>? imagesUrls;

  const Project({
    this.name,
    this.description,
    this.imagesUrls,
    this.googlePlay,
    this.appStore,
    this.github,
    this.features,
    this.iconUrl,
    this.backgroundUrl,
    this.pubspec,
    this.lastUpdate,
    this.status,
    this.notes,
    this.type,
  });
}
