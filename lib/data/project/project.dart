class Project {
  String? name;
  String? description;
  String? backgroundUrl;
  String? googlePlay;
  String? appStore;
  String? github;
  String? iconUrl;
  String? type;
  List<String>? features;
  List<String>? pubspec;
  String? notes;
  String? lastUpdate;
  String? status;



  List<String>? imagesUrls;

  Project({this.name, this.description, this.imagesUrls, this.googlePlay, this.appStore, this.github, this.features, this.iconUrl, this.backgroundUrl, this.pubspec, this.lastUpdate, this.status, this.notes, this.type});
}