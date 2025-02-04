class Project {
  String? name;
  String? description;
  String? iconUrl;
  String? backgroundUrl;
  List<String>? imagesUrls;
  String? googlePlay;
  String? appStore;
  String? github;
  Map<String,String>? features;

  Project({this.name, this.description, this.imagesUrls, this.googlePlay, this.appStore, this.github, this.features, this.iconUrl, this.backgroundUrl});
}