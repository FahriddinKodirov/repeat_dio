class Album{
final int userId;
final int id;
final String title;

const Album({
    required this.userId,
    required this.id,
    required this.title
});

factory Album.fromjson(Map json) {
  return Album(
    userId: json['userId'], 
    id: json['id'],
    title: json['title']);
}
}