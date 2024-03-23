import '../models/document_response.dart';

DocumentResponse extractDocument(String type, String data) {
  //Editar este codigo para extraer bien los datos de la cedula

  RegExp exp =
      RegExp(r".+\d{8}(\d{10})([A-ZÑ]+).+([A-ZÑ]+).+([A-ZÑ]+).+([A-ZÑ]+)?");
  if (exp.allMatches(data).isNotEmpty) {
    var firstMatch = exp.firstMatch(data);
    var code = BigInt.tryParse(firstMatch!.group(1)!);
    var name = '';
    if (firstMatch.groupCount == 6) {
      name =
          "${firstMatch.group(5)!} ${firstMatch.group(4)!} ${firstMatch.group(3)!} ${firstMatch.group(2)!}";
    } else if (firstMatch.groupCount == 6) {
      name =
          "${firstMatch.group(4)!} ${firstMatch.group(3)!} ${firstMatch.group(2)!}";
    }

    if (code != null) {
      return DocumentResponse(type: type, number: code, name: name);
    }
  }

  return DocumentResponse.empty();
}
