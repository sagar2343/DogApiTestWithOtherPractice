/// data : [{"id":1,"userName":"Leanne Graham","petName":"Bret","petImage":"https://cdn.shibe.online/shibes/04be82add971f2b8490b5ec2308d3426e8494ad9.jpg","isFriendly":true},{"id":2,"userName":"Ervin Howell","petName":"Anto","petImage":"https://cdn.shibe.online/shibes/655be60d14f2a0dfb3060dae20c4aad0194b3393.jpg","isFriendly":false},{"id":3,"userName":"Clementine Bauch","petName":"Samaurai","petImage":"https://cdn.shibe.online/shibes/2d2e282fe2af42373600b819f80b869e1e7b18e9.jpg","isFriendly":false},{"id":4,"userName":"Patricia Lebsack","petName":"Karin","petImage":"https://cdn.shibe.online/shibes/b2bfced02351f90fffe4c9f67129bb5cc69ef8de.jpg","isFriendly":false},{"id":5,"userName":"Chelsey Dietrich","petName":"Aisle","petImage":"https://cdn.shibe.online/shibes/8945cfa8f6a37efd24fa21fae6353b8c3537c381.jpg","isFriendly":true},{"id":6,"userName":"Mrs. Dennis Schulist","petName":"Leo","petImage":"https://cdn.shibe.online/shibes/4deaac9baec39e8a93889a84257338ebb89eca50.jpg","isFriendly":true},{"id":7,"userName":"Kurtis Weissnat","petName":"Elvyn","petImage":"https://cdn.shibe.online/shibes/250045491c507134de892066e1da8a927d033974.jpg","isFriendly":false},{"id":8,"userName":"Nicholas Runolfsdottir V","petName":"Max","petImage":"https://cdn.shibe.online/shibes/7381db9f8ac34f4c4d6e87b368a498f18482bc04.jpg","isFriendly":true},{"id":9,"userName":"Glenna Reichert","petName":"Dino","petImage":"https://cdn.shibe.online/shibes/543b506d005c459dc64c38c6a8e9c5ac8621c4d8.jpg","isFriendly":false},{"id":10,"userName":"Clementina DuBuque","petName":"Miro","petImage":"https://cdn.shibe.online/shibes/11670957b95b733c8b86d40fed27c655a265d29d.jpg","isFriendly":true},{"id":11,"userName":"Menoi Rubala","petName":"Balo","petImage":"https://cdn.shibe.online/shibes/c5bf11ac2dc4f660d15b7d31c37ce56203d73513.jpg","isFriendly":false},{"id":12,"userName":"Sabrina Declo","petName":"Samsu","petImage":"https://cdn.shibe.online/shibes/6d05b676bb40d18686543ccbd92bff1f329ebd16.jpg","isFriendly":true},{"id":13,"userName":"Eddy Katusa","petName":"Pirate","petImage":"https://cdn.shibe.online/shibes/6ddc38b0e28399ba27cd53019b0a5998cdbfdbed.jpg","isFriendly":true},{"id":14,"userName":"Minaco Retro","petName":"Devil","petImage":"https://cdn.shibe.online/shibes/0f305bd1f711737046266435fdbd1eac201329f7.jpg","isFriendly":false}]

class PetsModel {
  PetsModel({
      List<Data>? data,}){
    _data = data;
}

  PetsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;
  PetsModel copyWith({ List<Data>? data }) => PetsModel( data: data ?? _data );
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// userName : "Leanne Graham"
/// petName : "Bret"
/// petImage : "https://cdn.shibe.online/shibes/04be82add971f2b8490b5ec2308d3426e8494ad9.jpg"
/// isFriendly : true

class Data {
  Data({
      num? id, 
      String? userName, 
      String? petName, 
      String? petImage, 
      bool? isFriendly,}){
    _id = id;
    _userName = userName;
    _petName = petName;
    _petImage = petImage;
    _isFriendly = isFriendly;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['userName'];
    _petName = json['petName'];
    _petImage = json['petImage'];
    _isFriendly = json['isFriendly'];
  }
  num? _id;
  String? _userName;
  String? _petName;
  String? _petImage;
  bool? _isFriendly;
Data copyWith({  num? id,
  String? userName,
  String? petName,
  String? petImage,
  bool? isFriendly,
}) => Data(  id: id ?? _id,
  userName: userName ?? _userName,
  petName: petName ?? _petName,
  petImage: petImage ?? _petImage,
  isFriendly: isFriendly ?? _isFriendly,
);
  num? get id => _id;
  String? get userName => _userName;
  String? get petName => _petName;
  String? get petImage => _petImage;
  bool? get isFriendly => _isFriendly;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userName'] = _userName;
    map['petName'] = _petName;
    map['petImage'] = _petImage;
    map['isFriendly'] = _isFriendly;
    return map;
  }

}