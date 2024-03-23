class DocumentResponse {
  DocumentResponse(
      {required this.type, required this.number, required this.name});

  final String type;
  final BigInt number;
  final String name;

  static DocumentResponse empty() => (DocumentResponse(
        type: '',
        number: BigInt.zero,
        name: '',
      ));
}
