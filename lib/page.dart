class Page {
  final String title;
  final String description;
  final List<int> colors;
  final String photo;
  final String photoDescription;

  Page(
      {this.title,
      this.description,
      this.colors,
      this.photo,
      this.photoDescription});

  static List<Page> pages = [
    Page(
      title: "Space",
      description: "Solar system",
      colors: [0xFFFEAE06, 0xFFFF5274],
      photo: 'space.png',
      photoDescription: "Saturn",
    ),
    Page(
      title: "Relief",
      description: "Mountains",
      colors: [0xFFFD0BF4, 0xFFF20095],
      photo: 'Relief.png',
      photoDescription: "Himalayas",
    ),
    Page(
      title: "Nature",
      description: "Grow",
      colors: [0xFF29D9FF, 0xFF0C9FFF],
      photo: 'Nature.png',
      photoDescription: "Forest",
    ),
    Page(
      title: "Take off",
      description: "Apollo 11",
      colors: [0xFFA2FFAE, 0xFF18D0F2],
      photo: 'Takeoff.png',
      photoDescription: "Space",
    ),
  ];
}
