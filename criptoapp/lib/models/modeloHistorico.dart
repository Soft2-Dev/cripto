// ignore_for_file: file_names

class Historys {
  List<History> dato = [];
  Historys();

  Historys.fromlist(List<dynamic> datos) {
    if (datos == null) return;
    List<dynamic> data = [];
    for (var i = 0; i < datos.length; i++) {
      Map<String, dynamic> temp = {
        'tiempo': datos[i][0],
        'abierto': datos[i][1],
        'alto': datos[i][2],
        'bajo': datos[i][3],
        'cerrado': datos[i][4],
      };
      data.add(temp);
    }

    for (var item in data) {
      final detalle = History.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class History {
  String? tiempo;
  String? abierto;
  String? alto;
  String? bajo;
  String? cerrado;

  History({
    this.tiempo,
    this.abierto,
    this.alto,
    this.bajo,
    this.cerrado,
  });

  History.fromJsonMap(Map<String, dynamic> datos) {
    tiempo = datos['tiempo'].toString();
    abierto = datos['abierto'].toString();
    alto = datos['alto'].toString();
    bajo = datos['bajo'].toString();
    cerrado = datos['cerrado'].toString();
  }
}
