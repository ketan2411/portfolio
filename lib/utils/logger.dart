import "dart:developer" as dev;
appLog({required String name, String log = ""}){
  dev.log(log, name: name);
}