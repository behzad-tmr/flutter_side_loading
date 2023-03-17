class CheckUpdateRm {
  CheckUpdateRm({
    required this.id,
    required this.version,
    required this.buildNumber,
    required this.forceInstall,
    required this.link,
  });
  late final int id;
  late final String version;
  late final String buildNumber;
  late final String forceInstall;
  late final String link;

  CheckUpdateRm.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    version = json['version']?? '';
    buildNumber = json['build_number'] ?? '';
    forceInstall = json['force_install'] ?? '';
    link = json['link'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['version'] = version;
    _data['build_number'] = buildNumber;
    _data['force_install'] = forceInstall;
    _data['link'] = link;
    return _data;
  }
}