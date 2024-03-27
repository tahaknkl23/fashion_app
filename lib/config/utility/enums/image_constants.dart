enum ImageConstants {
  productOne("product_one"),
  prada("Prada"),
  boss("Boss"),
  catier("Catier"),
  gucci("Gucci"),
  tifanniy("Tifanny"),
  burberry("Burberry"),
  video("video"),
  topone("top_one"),
  toptwo("top_two"),
  topthree("top_three");

  final String value;
  const ImageConstants(this.value);

  String get toPng => 'assets/images/$value.png';
  String get toSvg => 'assets/svg/$value.svg';
  String get toJson => 'assets/json/$value.json';
  String get toMp4 => 'assets/video/$value.mp4';
}
