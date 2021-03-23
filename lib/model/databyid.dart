class Data {
  final String objectId;
  final String title;
  Data({this.objectId, this.title});

  factory Data.fromJson(Map<String, dynamic> map) {
    return Data(
      objectId: map["objectID"],
      title: map["title"],
    );
  }
}
