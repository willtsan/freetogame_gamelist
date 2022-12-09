import 'package:dartz/dartz.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/dto/game.dto.dart';

abstract class GetGameListUseCase {
  Future<Either<Exception, List<GameDto>>> call();
}
