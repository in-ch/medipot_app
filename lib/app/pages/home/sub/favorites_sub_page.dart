import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/controllers/controllers.dart';
import 'package:medipot_app/app/style/theme.dart';
import 'package:medipot_app/app/views/views.dart';

class FavoritesSubPage extends GetView<FavoritesController> {
  const FavoritesSubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: Scaffold(
          appBar: AppBar(
              title: const Text(
                "관심 목록",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0),
          body: const Column(
            children: [Expanded(child: _FavoritesBody())],
          )),
    );
  }
}

class _FavoritesBody extends StatefulWidget {
  const _FavoritesBody();

  @override
  State<_FavoritesBody> createState() => _FavoritesBodyState();
}

class _FavoritesBodyState extends State<_FavoritesBody>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<_FavoritesBody> {
  @override
  bool get wantKeepAlive => false;
  // 탭 전환 시 새로고침 막기
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TabBar(
            tabs: [
              Container(
                height: 40,
                alignment: Alignment.center,
                child: const Text(
                  "찜한 목록",
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: const Text(
                  "올린 매물",
                ),
              ),
            ],
            indicatorColor: colorScheme.primary,
            labelColor: colorScheme.primary,
            unselectedLabelColor: const Color.fromARGB(255, 136, 136, 136),
            controller: _tabController,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: LikeLocations(),
                ),
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: MyLocations(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
