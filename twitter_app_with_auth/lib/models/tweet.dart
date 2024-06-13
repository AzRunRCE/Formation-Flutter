class Tweet {
  Tweet(this.id, this.username, this.content, this.timestamp, this.likes,
      this.retweets);
  int id;
  String username;
  String content;
  String timestamp;
  int likes;
  int retweets;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['content'] = content;
    data['likes'] = likes;
    data['retweets'] = retweets;
    return data;
  }

  static Tweet fromJson(Map<String, dynamic> data) {
    return Tweet(
      data['id'],
      data['username'],
      data['content'],
      data['timestamp'].toString(),
      data['likes'],
      data['retweets'],
    );
  }
}
