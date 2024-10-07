class ActorsModel {
  String ?name;
  String ?nationality;
  List<String> ?known_for;
  List<String> ?awards;
  String? biography;
  String ?image;

  ActorsModel({

    required this.name,

    required this.nationality,
    required this.known_for,
    required this.awards,
    required  this.biography,
    required this.image});

   ActorsModel.fromJson(Map<String , dynamic> json){

      name=json['name'];

      nationality=json['nationality'];
      known_for=json['known_for'].cast<String>();
      awards=json['awards'].cast<String>();
      biography=json['biography'];
      image=json['image'];
  }

  Map<String, dynamic>  toJson(){
    final Map<String, dynamic> data =  <String, dynamic>{};


     data['name']=name;

     data['nationality']=nationality;
    data['known_for']=known_for;
     data['awards']=awards;
     data['biography']=biography;
     data['image']=image;
     return data;

  }


}
