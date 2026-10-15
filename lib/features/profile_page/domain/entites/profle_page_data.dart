class DataOfProfileEntity {
  final String full_name;
  final String email;
  final String location;
  final String avatar_url;
  final DateTime created_at;

  DataOfProfileEntity({
    required this.full_name,
    required this.email,
    required this.location,
    required this.avatar_url,
    required this.created_at,
  });
}
