import 'package:dartz/dartz.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/dto/game.dto.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/repositories/get_game_list.repository.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/usecases/get_game_list.usecase.dart';

class GetGameListUseCaseImp extends GetGameListUseCase {
  final GetGameListRepository _gameListRepository;

  GetGameListUseCaseImp(this._gameListRepository);

  @override
  Future<Either<Exception, List<GameDto>>> call() => _gameListRepository.call();
}
