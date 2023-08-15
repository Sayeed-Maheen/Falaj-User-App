class OnBoardingContent {
  String title;
  String subTitle;
  String description;
  String image;

  OnBoardingContent(
      {required this.title,
      required this.subTitle,
      required this.image,
      required this.description});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      image: 'assets/images/onboarding 1.png',
      title: 'Explore the',
      subTitle: 'Falaj',
      description: "Discover the world heritage"),
  OnBoardingContent(
    image: 'assets/images/onboarding 2.png',
    title: 'Buy a slot',
    subTitle: 'easily',
    description: "Discover the world heritage",
  ),
];
