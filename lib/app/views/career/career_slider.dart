import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/app/routes/routes.dart';

class CareerSlider extends StatefulWidget {
  final List<Career> careers;

  const CareerSlider({Key? key, required this.careers}) : super(key: key);

  @override
  CareerSliderState createState() => CareerSliderState();
}

class CareerSliderState extends State<CareerSlider> {
  final PageController _pageController = PageController();
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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "🔥 초빙 공고.zip",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 150.0,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.careers.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.careerDetail,
                            arguments: {'no': widget.careers[index].no});
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 243, 243, 243),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.network(
                                  widget.careers[index].imgs[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.careers[index].hospital.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(height: 5),
                                Text(widget.careers[index].title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300))
                              ],
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
                child: Text(
                  "${_currentPage + 1} / ${widget.careers.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
