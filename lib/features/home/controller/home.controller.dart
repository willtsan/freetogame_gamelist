import 'package:mobx/mobx.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/dto/game.dto.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/usecases/get_game_list.usecase.dart';
part 'home.controller.g.dart';

// ignore: library_private_types_in_public_api
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetGameListUseCase _getGameListUseCase;

  List<GameDto> cacheData = [];
  String errorMessage = '';
  bool searchEnabled = false;

  _HomeControllerBase(this._getGameListUseCase);

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  ObservableList<GameDto> contentForDisplay = ObservableList<GameDto>();

  @action
  void setIsLoading(bool value) => isLoading = value;

  @action
  void setIsError(bool value) => isError = value;

  @action
  Future<void> getListOfGames() async {
    setIsLoading(true);
    setIsError(false);

    cacheData.clear();

    var request = await _getGameListUseCase();
    request.fold((l) {
      setIsError(true);
      errorMessage = l.toString().replaceAll('Exception: ', '');
    }, (r) {
      cacheData.addAll(r);
    });

    await applyFilters();

    setIsLoading(false);
  }

  @action
  Future<void> applyFilters({String? filter}) async {
    contentForDisplay.clear();

    if (filter == null) {
      contentForDisplay.addAll(cacheData.toSet().toList());
    } else {
      List<String> keysToSearch = ['title', 'short_description', 'publisher'];
      List<GameDto> temp = [];
      for (String key in keysToSearch) {
        temp = cacheData.toSet().toList();
        temp.retainWhere((element) => (element.toJson()[key] as String)
            .toLowerCase()
            .contains(filter.toLowerCase()));

        temp.removeWhere((element) => contentForDisplay.contains(element));
        contentForDisplay.addAll(temp);
      }
    }
  }

  @action
  Future<void> orderData(String orderKey, {bool? reverse}) async {
    contentForDisplay.sort(
      ((a, b) => (a.toJson()[orderKey] as String).compareTo(
            (b.toJson()[orderKey] as String),
          )),
    );

    if (reverse != null && reverse) {
      List<GameDto> contentReverserd = contentForDisplay.reversed.toList();
      contentForDisplay.clear();
      contentForDisplay.addAll(contentReverserd);
    }
  }

  @action
  Future<void> resetPage() async {
    getListOfGames();
  }

  @action
  GameDto? getGameById(int id) {
    return cacheData.firstWhere((element) => element.id == id);
  }
}
