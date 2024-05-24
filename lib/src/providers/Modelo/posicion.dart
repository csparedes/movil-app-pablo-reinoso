class Posicion {
  int? batteryLevel;
  int? channelId;
  int? deviceId;
  String? deviceName;
  int? deviceTypeId;
  int? gsmCellid;
  int? gsmCellid1;
  int? gsmLac;
  int? gsmLac1;
  int? gsmMcc;
  int? gsmMnc;
  int? gsmSignalDbm;
  int? gsmSignalDbm1;
  int? gsmSignalLevel;
  String? ident;
  String? messageType;
  String? peer;
  int? positionAltitude;
  int? positionDirection;
  double? positionLatitude;
  double? positionLongitude;
  int? positionSatellites;
  double? positionSpeed;
  bool? positionValid;
  int? protocolId;
  double? serverTimestamp;
  int? stepsCount;
  int? timestamp;
  String? vehicleState;
  int? vehicleStateBitmask;
  String? vendorCode;

  Posicion(
      {this.batteryLevel,
      this.channelId,
      this.deviceId,
      this.deviceName,
      this.deviceTypeId,
      this.gsmCellid,
      this.gsmCellid1,
      this.gsmLac,
      this.gsmLac1,
      this.gsmMcc,
      this.gsmMnc,
      this.gsmSignalDbm,
      this.gsmSignalDbm1,
      this.gsmSignalLevel,
      this.ident,
      this.messageType,
      this.peer,
      this.positionAltitude,
      this.positionDirection,
      this.positionLatitude,
      this.positionLongitude,
      this.positionSatellites,
      this.positionSpeed,
      this.positionValid,
      this.protocolId,
      this.serverTimestamp,
      this.stepsCount,
      this.timestamp,
      this.vehicleState,
      this.vehicleStateBitmask,
      this.vendorCode});

  Posicion.fromJson(Map<dynamic, dynamic> json) {
    positionAltitude = json['position.altitude'];
    positionDirection = json['position.direction'];
    positionLatitude = json['position.latitude'];
    positionLongitude = json['position.longitude'];
    positionSatellites = json['position.satellites'];
    positionValid = json['position.valid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['battery.level'] = this.batteryLevel;
    data['channel.id'] = this.channelId;
    data['device.id'] = this.deviceId;
    data['device.name'] = this.deviceName;
    data['device.type.id'] = this.deviceTypeId;
    data['gsm.cellid'] = this.gsmCellid;
    data['gsm.cellid.1'] = this.gsmCellid1;
    data['gsm.lac'] = this.gsmLac;
    data['gsm.lac.1'] = this.gsmLac1;
    data['gsm.mcc'] = this.gsmMcc;
    data['gsm.mnc'] = this.gsmMnc;
    data['gsm.signal.dbm'] = this.gsmSignalDbm;
    data['gsm.signal.dbm.1'] = this.gsmSignalDbm1;
    data['gsm.signal.level'] = this.gsmSignalLevel;
    data['ident'] = this.ident;
    data['message.type'] = this.messageType;
    data['peer'] = this.peer;
    data['position.altitude'] = this.positionAltitude;
    data['position.direction'] = this.positionDirection;
    data['position.latitude'] = this.positionLatitude;
    data['position.longitude'] = this.positionLongitude;
    data['position.satellites'] = this.positionSatellites;
    data['position.speed'] = this.positionSpeed;
    data['position.valid'] = this.positionValid;
    data['protocol.id'] = this.protocolId;
    data['server.timestamp'] = this.serverTimestamp;
    data['steps.count'] = this.stepsCount;
    data['timestamp'] = this.timestamp;
    data['vehicle.state'] = this.vehicleState;
    data['vehicle.state.bitmask'] = this.vehicleStateBitmask;
    data['vendor.code'] = this.vendorCode;
    return data;
  }
}
