import 'package:mobx/mobx.dart';
part 'future_controller.g.dart';

class FutureController = FutureControllerBase with _$FutureController;

abstract class FutureControllerBase with Store {
  @observable
  // var nomeFuture = Future.value("").asObservable();
  var nomeFuture = ObservableFuture.value("");

  Future<void> buscarNome() async {
    // nomeFuture =
    //     Future.delayed(const Duration(seconds: 2), () => "José Augusto")
    //         .asObservable();

    final buscaNomeFuture =
        Future.delayed(const Duration(seconds: 2), () => "José Augusto");

    // nomeFuture = buscaNomeFuture.asObservable();
    nomeFuture = ObservableFuture(buscaNomeFuture);
  }
}
