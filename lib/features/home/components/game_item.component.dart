import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/dto/game.dto.dart';

class GameItemComponent extends StatefulWidget {
  final GameDto gameData;

  const GameItemComponent({Key? key, required this.gameData}) : super(key: key);

  @override
  GameItemComponentState createState() => GameItemComponentState();
}

class GameItemComponentState extends State<GameItemComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/details', arguments: {'id': widget.gameData.id});
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CachedNetworkImage(
                    imageUrl: widget.gameData.thumbnail,
                    errorWidget: (context, url, error) => Container(),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.gameData.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.gameData.publisher,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.gameData.shortDescription,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
