class GameDto {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;

  GameDto(
      this.id,
      this.title,
      this.thumbnail,
      this.shortDescription,
      this.gameUrl,
      this.genre,
      this.platform,
      this.publisher,
      this.developer,
      this.releaseDate,
      this.freetogameProfileUrl);

  factory GameDto.fromJson(Map<String, dynamic> json) => GameDto(
        json['id'],
        json['title'],
        json['thumbnail'],
        json['short_description'],
        json['game_url'],
        json['genre'],
        json['platform'],
        json['publisher'],
        json['developer'],
        json['release_date'],
        json['freetogame_profile_url'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "short_description": shortDescription,
        "game_url": gameUrl,
        "genre": genre,
        "platform": platform,
        "publisher": publisher,
        "developer": developer,
        "release_date": releaseDate,
        "freetogame_profile_url": freetogameProfileUrl
      };
}
