class DogImage {
  final String imageUrl;
  final String status;

  DogImage({required this.imageUrl, required this.status});

  factory DogImage.fromJson(Map<String, dynamic> json) {
    return DogImage(
      imageUrl: json['message'],
      status: json['status'],
    );
  }
}
