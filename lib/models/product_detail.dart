class ProductDetailModel {
  int? id;
  String? name;
  String? description;
  List<Variants>? variants;
  Media? media;
  Price? price;

  ProductDetailModel(
      {this.id,
      this.name,
      this.description,
      this.variants,
      this.media,
      this.price});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['variants'] != null) {
      variants = [];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
  }
}

class Variants {
  int? id;
  String? name;
  int? sizeId;
  String? brandSize;
  String? sizeDescription;
  String? displaySizeText;
  int? sizeOrder;
  String? sku;
  bool? isLowInStock;
  bool? isInStock;
  bool? isAvailable;
  int? colourWayId;
  String? colourCode;
  String? colour;
  Price? price;

  Variants(
      {this.id,
      this.name,
      this.sizeId,
      this.brandSize,
      this.sizeDescription,
      this.displaySizeText,
      this.sizeOrder,
      this.sku,
      this.isLowInStock,
      this.isInStock,
      this.isAvailable,
      this.colourWayId,
      this.colourCode,
      this.colour,
      this.price});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sizeId = json['sizeId'];
    brandSize = json['brandSize'];
    sizeDescription = json['sizeDescription'];
    displaySizeText = json['displaySizeText'];
    sizeOrder = json['sizeOrder'];
    sku = json['sku'];
    isLowInStock = json['isLowInStock'];
    isInStock = json['isInStock'];
    isAvailable = json['isAvailable'];
    colourWayId = json['colourWayId'];
    colourCode = json['colourCode'];
    colour = json['colour'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
  }
}

class Price {
  Current? current;
  Previous? previous;

  Price({this.current, this.previous});

  Price.fromJson(Map<String, dynamic> json) {
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    previous = json['previous'] != null
        ? new Previous.fromJson(json['previous'])
        : null;
  }
}

class Current {
  double? value;
  String? text;
  String? versionId;
  String? conversionId;

  Current({this.value, this.text, this.versionId, this.conversionId});

  Current.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    versionId = json['versionId'];
    conversionId = json['conversionId'];
  }
}

class Previous {
  double? value;
  String? text;
  String? versionId;
  String? conversionId;

  Previous({this.value, this.text, this.versionId, this.conversionId});

  Previous.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    versionId = json['versionId'];
    conversionId = json['conversionId'];
  }
}

class Media {
  List<Images>? images;

  Media({this.images});

  Media.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }
}

class Images {
  String? url;

  Images({this.url});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}
