class ProductModel {
  int? id;
  String? name;
  Price? price;
  String? colour;
  int? colourWayId;
  String? brandName;
  bool? hasVariantColours;
  bool? hasMultiplePrices;
  int? productCode;
  String? productType;
  String? url;
  String? imageUrl;
  String? videoUrl;
  bool? isSellingFast;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.colour,
      this.colourWayId,
      this.brandName,
      this.hasVariantColours,
      this.hasMultiplePrices,
      this.productCode,
      this.productType,
      this.url,
      this.imageUrl,
      this.videoUrl,
      this.isSellingFast});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    colour = json['colour'];
    colourWayId = json['colourWayId'];
    brandName = json['brandName'];
    hasVariantColours = json['hasVariantColours'];
    hasMultiplePrices = json['hasMultiplePrices'];
    productCode = json['productCode'];
    productType = json['productType'];
    url = json['url'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
    isSellingFast = json['isSellingFast'];
  }
}

class Price {
  Current? current;
  Current? previous;
  Current? rrp;
  bool? isMarkedDown;
  bool? isOutletPrice;
  String? currency;

  Price(
      {this.current,
      this.previous,
      this.rrp,
      this.isMarkedDown,
      this.isOutletPrice,
      this.currency});

  Price.fromJson(Map<String, dynamic> json) {
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    previous = json['previous'] != null
        ? new Current.fromJson(json['previous'])
        : null;
    rrp = json['rrp'] != null ? new Current.fromJson(json['rrp']) : null;
    isMarkedDown = json['isMarkedDown'];
    isOutletPrice = json['isOutletPrice'];
    currency = json['currency'];
  }
}

class Current {
  double? value;
  String? text;

  Current({this.value, this.text});

  Current.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }
}
