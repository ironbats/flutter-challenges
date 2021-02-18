import 'package:rxdart/rxdart.dart';
import 'package:softskills/service/listSkills.dart';
import 'package:rxdart/rxdart.dart';

class ApiService {

  CallAlSoftSKills _apiService = CallAlSoftSKills();
  final _searchController = BehaviorSubject<String>();
  Observable<String> get searchFlux => _searchController.stream;
  Sink<String> get searchEvent => _searchController.sink;
  Observable<SearchResult> apiResultFlux;

  ApiService() {
    apiResultFlux = searchFlux
        .distinct()
        .where((value) => value.length > 2)
        .debounce(Duration(microseconds: 500))
        .asyncMap(_apiService.search)
        .switchMap((value) => Observable.just(value));
  }

  void dispose() {
    _searchController.close();
  }
}
