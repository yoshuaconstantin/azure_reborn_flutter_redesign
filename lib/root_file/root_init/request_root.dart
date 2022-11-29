import 'package:root/root.dart';

class RequestRoot {


  Future<bool> checkRoot() async {
    bool? resultAvailRoot = await Root.isRootAvailable();

    return resultAvailRoot ?? false;
  }

  Future<bool> statusRoot() async {
    if (await checkRoot()) {
      bool? checkRootStatus = await Root.isRooted();

      return checkRootStatus ?? false;
    }
    return false;
  }

  Future<void> nonReturnRootFunction (String command) async {
    await Root.exec(cmd: command);
  }

  Future<String> returnStringRootFucntion (String command) async {
    String? returnStringResult = await Root.exec(cmd: command);

    return returnStringResult ?? "error";
  }


}
