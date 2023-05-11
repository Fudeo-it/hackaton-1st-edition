class BlogModel {
  final String title;
  final String image;
  final String url;

  BlogModel({
    required this.title,
    required this.image,
    required this.url,
  });
}

final blogPosts = [
  BlogModel(
    title: "Flutter Forward 2023: tutte le novità più importanti",
    image: "assets/images/blog/fudeo_blog_1.png",
    url: "https://www.fudeo.it/blog/flutter-forward-3.7-differenze-novita",
  ),
  BlogModel(
    title: "Flutter 3: tutte le novità più importanti",
    image: "assets/images/blog/fudeo_blog_2.png",
    url: "https://www.fudeo.it/blog/flutter-3-differenze-novit%C3%A0",
  ),
  BlogModel(
    title: "Flutter Web: cos'è, vantaggi e svantaggi",
    image: "assets/images/blog/fudeo_blog_3.png",
    url: "https://www.fudeo.it/blog/flutter-web-cos-e-vantaggi-svantaggi",
  ),
  BlogModel(
    title:
        "Flutter: la più completa guida introduttiva sul framework cross-platform per sviluppare app",
    image: "assets/images/blog/fudeo_blog_4.png",
    url:
        "https://www.fudeo.it/blog/flutter-guida-completa-tutorial-introduttiva-italiano",
  ),
  BlogModel(
    title: "React Native vs Flutter: la differenza pratica nell'utilizzo",
    image: "assets/images/blog/fudeo_blog_5.png",
    url:
        "https://www.fudeo.it/blog/react-native-vs-flutter-differenza-pratica-uso",
  ),
];
