class Model{

  final String NumberofDiamond,Price,Category,Total;
  // final DateTime Date;
  const Model({required this.NumberofDiamond, required this.Price, required this.Category,required this.Total,  });


  Model fromJson(json) {
    return Model(
        NumberofDiamond: json['NumberofDiamond'], Price: json['Price'], Category: json['Category'], Total: json['Total'], );
  }
  Map<String, dynamic> toJson() {
    return {'NumberofDiamond': NumberofDiamond, 'Price': Price,'Category':Category,'Total':Total,};
  }

}