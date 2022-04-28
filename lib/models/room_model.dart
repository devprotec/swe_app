

// class RoomDataModel{
//   String? roomName;
//   //String? value;

//   RoomDataModel(this.roomName, );

//   RoomDataModel.fromList(String roomNames, index){
//     roomName = roomNames;
//   }

  


// }

class MapData {
final String? roomName;


MapData({this.roomName});

factory MapData.fromJson(Map<String, dynamic> json){
  return MapData(
  roomName: json['roomName'],
 
  );
}
}

class MapDataRoom {
final String? co;
final String? cotwo;
final String? temp;
final String? methane;
final String? sotwo;


MapDataRoom({this.co, this.cotwo, this.temp, this.methane, this.sotwo});

factory MapDataRoom.fromJson(Map<String, dynamic> json){
  return MapDataRoom(
  co: json['co'],
  cotwo: json['cotwo'],
  temp: json['temp'],
  methane: json['methane'],
  sotwo: json['sotwo']
 
  );
}
}