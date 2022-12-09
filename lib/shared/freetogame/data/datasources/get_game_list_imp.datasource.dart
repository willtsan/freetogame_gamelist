import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pravaler_gamelist/shared/freetogame/data/datasources/get_game_list.datasource.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/dto/game.dto.dart';

class GetGameListDatasourceImp extends GetGameListDatasource {
  @override
  Future<Either<Exception, List<GameDto>>> call() async {
    List<GameDto> results = [];

    try {
      var request = await Dio().get('https://www.freetogame.com/api/games');
      for (var item in request.data) {
        results.add(GameDto.fromJson(item));
      }

      return Right<Exception, List<GameDto>>(results);
    } catch (e) {
      return Left<Exception, List<GameDto>>(Exception(e));
    }
  }
}
