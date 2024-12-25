import 'package:flutter/material.dart';

class CareerDetailSlider extends StatefulWidget {
  final List<String> imageUrls;

  const CareerDetailSlider({super.key, required this.imageUrls});

  @override
  CareerDetailSliderState createState() => CareerDetailSliderState();
}

class CareerDetailSliderState extends State<CareerDetailSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updateCurrentPage);
  }

  void _updateCurrentPage() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,
      width: double.infinity,
      child: SizedBox(
        width: double.infinity,
        height: 350.0,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350.0,
                  child: widget.imageUrls[index] == ""
                      ? Container(
                          height: 350,
                          width: double.infinity,
                          color: Colors.black45)
                      : Image.network(
                          widget.imageUrls[index],
                          fit: BoxFit.fitHeight,
                        ),
                ),
                Positioned(
                  top: 220,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      "${_currentPage + 1} / ${widget.imageUrls.length}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
