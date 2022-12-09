import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pravaler_gamelist/features/home/controller/home.controller.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/dto/game.dto.dart';

class DetailsPage extends StatefulWidget {
  final int id;

  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  final HomeController _controller = GetIt.I.get();

  late GameDto? gameSelected;

  @override
  void initState() {
    super.initState();

    gameSelected = _controller.getGameById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    if (gameSelected == null) {
      return Container();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(gameSelected!.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 32,
              ),
              CachedNetworkImage(
                imageUrl: gameSelected!.thumbnail,
                errorWidget: (context, url, error) => Container(),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              const Divider(),
              Text(
                gameSelected!.title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                gameSelected!.publisher,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                gameSelected!.platform,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Genre: ${gameSelected!.genre}',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Release Date: ${gameSelected!.releaseDate}',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                gameSelected!.shortDescription,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }
  }
}
