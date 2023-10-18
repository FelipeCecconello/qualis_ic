class Todos {
  final String? issn;
  final String? periodico;
  final String? extratoCAPESComp;
  final String? extratoCAPES;
  final String? area;

  Todos({
    this.issn,
    this.periodico,
    this.extratoCAPESComp,
    this.extratoCAPES,
    this.area,
  });

  factory Todos.fromJson(List<dynamic> json) {
    return Todos(
      issn: json[0],
      periodico: json[1],
      extratoCAPESComp: json[2],
      extratoCAPES: json[3],
      area: json[4],
    );
  }
}
