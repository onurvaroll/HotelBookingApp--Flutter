class RoomModel {
  final String name;
  final String photoUrl;
  final String available;
  final String starRating;
  final String perDay;

  RoomModel(
      {required this.name,
      required this.photoUrl,
      required this.available,
      required this.starRating,
      required this.perDay});
}
