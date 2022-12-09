import 'package:dartz/dartz.dart';
import 'package:pravaler_gamelist/shared/freetogame/data/datasources/get_game_list.datasource.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/dto/game.dto.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/repositories/get_game_list.repository.dart';

class GetGameListRepositoryImp extends GetGameListRepository {
  final GetGameListDatasource _gameListDatasource;

  GetGameListRepositoryImp(this._gameListDatasource);

  @override
  Future<Either<Exception, List<GameDto>>> call() => _gameListDatasource.call();
}
