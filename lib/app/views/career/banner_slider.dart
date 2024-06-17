import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({Key? key}) : super(key: key);

  @override
  BannerSliderState createState() => BannerSliderState();
}

class BannerSliderState extends State<BannerSlider>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late final AnimationController _animationController;

  List<Map<String, dynamic>> banners = [
    {
      'asset': 'assets/image/sample/sample_banner_1.png',
      'no': 1,
      'link': 'https://forms.gle/58Xs7XtZNeTN5h4EA'
    },
    {'asset': 'assets/image/sample/sample_banner_2.png', 'no': 2, 'link': ''},
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updateCurrentPage);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
          _nextPage();
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  void _updateCurrentPage() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
    });
  }

  void _nextPage() {
    if (_currentPage < banners.length - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 75.0,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 243, 243, 243),
              ),
              child: PageView.builder(
                controller: _pageController,
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      String webviewLink = dotenv.get("WEBVIEW_SERVER");
                      int eventNo = banners[index]['no'];
                      String link = banners[index]['link'];
                      final Uri url = link == ''
                          ? Uri.parse('$webviewLink/event/$eventNo')
                          : Uri.parse(link);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 243, 243, 243),
                          ),
                          child: ClipRRect(
                            child: Image.asset(
                              banners[index]['asset'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 20.0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                  child: Text(
                    "${_currentPage + 1} / ${banners.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
