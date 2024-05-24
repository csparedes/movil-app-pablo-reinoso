class Usuario {
  IdUsuario? idUsuario;
  String? nombre;
  String? apellido;
  String? cedula;
  String? rol;
  String? pass;
  String? codigoApp;
  String? codigoDispositivo;
  String? activo;
  String? createdAt;
  int? createdBy;
  String? modifiedAt;
  int? modifiedBy;
  String? deletedAt;
  int? deletedBy;

  Usuario(
      {this.idUsuario,
      this.nombre,
      this.apellido,
      this.cedula,
      this.rol,
      this.pass,
      this.codigoApp,
      this.codigoDispositivo,
      this.activo,
      this.createdAt,
      this.createdBy,
      this.modifiedAt,
      this.modifiedBy,
      this.deletedAt,
      this.deletedBy});

  Usuario.fromJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'] != null
        ? new IdUsuario.fromJson(json['idUsuario'])
        : null;
    nombre = json['nombre'];
    apellido = json['apellido'];
    cedula = json['cedula'];
    rol = json['rol'];
    pass = json['pass'];
    codigoApp = json['codigoApp'];
    codigoDispositivo = json['codigoDispositivo'];
    activo = json['activo'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    modifiedAt = json['modifiedAt'];
    modifiedBy = json['modifiedBy'];
    deletedAt = json['deletedAt'];
    deletedBy = json['deletedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.idUsuario != null) {
      data['idUsuario'] = this.idUsuario!.toJson();
    }
    data['nombre'] = this.nombre;
    data['apellido'] = this.apellido;
    data['cedula'] = this.cedula;
    data['rol'] = this.rol;
    data['pass'] = this.pass;
    data['codigoApp'] = this.codigoApp;
    data['codigoDispositivo'] = this.codigoDispositivo;
    data['activo'] = this.activo;
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy.toString();
    data['modifiedAt'] = this.modifiedAt;
    data['modifiedBy'] = this.modifiedBy.toString();
    data['deletedAt'] = this.deletedAt;
    data['deletedBy'] = this.deletedBy.toString();
    return data;
  }
}

class IdUsuario {
  int? timestamp;
  int? machine;
  int? pid;
  int? increment;
  String? creationTime;

  IdUsuario(
      {this.timestamp,
      this.machine,
      this.pid,
      this.increment,
      this.creationTime});

  IdUsuario.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    machine = json['machine'];
    pid = json['pid'];
    increment = json['increment'];
    creationTime = json['creationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['machine'] = this.machine;
    data['pid'] = this.pid;
    data['increment'] = this.increment;
    data['creationTime'] = this.creationTime;
    return data;
  }
}
