class OnboardModel {
  final String image;
  final String title;
  final String description;

  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardModel> onboardData = [
  OnboardModel(
    image: "assets/Images/10.png",
    title: "Shopping is now easier",
    description: "Now you can shop online without having to leave your home. ",
  ),
  OnboardModel(
    image: "assets/Images/12.png",
    title: "Big Discount",
    description: "Get big discounts on your favorite products & save money. ",
  ),
  OnboardModel(
    image: "assets/Images/13.png",
    title: "Compare Products",
    description: "You can compare products and choose the best one for you . ",
  ),
  OnboardModel(
    image: "assets/Images/14.png",
    title: "Fast Delivery",
    description: "Fast and reliable delivery to your door. ",
  ),
  OnboardModel(
    image: "assets/Images/15.png",
    title: "Lets Get Started",
    description: "Now you can shop online without having to leave your home. ",
  ),
];
