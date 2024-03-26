// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docspot_app/app/utils/utils.dart';
import 'package:docspot_app/data/models/models.dart';
import 'package:docspot_app/services/services.dart';

class LikeLocationController extends GetxController {
  RxInt page = 0.obs;
  List<Location> likeLocations = [];

  /// [비즈니스 로직]
  /// 단순히 LikeList를 초기화한다.
  Future<dynamic> fetchLikeLocations() async {
    try {
      final response = await LikeLocationService.getLikeLocations();
      if (response['statusCode'] == 200) {
        likeLocations = [];
        final data = response['data'] as List;
        final list = List<LikeLocation>.from(
            data.map((item) => LikeLocation.fromJson(item)));
        for (var _location in list) {
          likeLocations.add(_location.location);
        }
      }
    } catch (error) {
      print(error);
      update();
    } finally {
      update();
    }
  }

  /// [비즈니스 로직]
  /// fetch likeLocations list
  Future<dynamic> getLikeLocations(PagingController pagingController) async {
    try {
      final response = await LikeLocationService.getLikeLocations();
      if (response['statusCode'] == 200) {
        final data = response['data'] as List;
        final list = List<LikeLocation>.from(
            data.map((item) => LikeLocation.fromJson(item)));
        likeLocations = [];
        for (var _location in list) {
          likeLocations.add(_location.location);
        }
        pagingController.appendLastPage(list);
        update();
      } else {
        throw Exception('Failed to FETCH LikeLocations');
      }
    } catch (error) {
      update();
      throw Exception(error);
    } finally {
      update();
    }
  }

  /// fetch getMyLocations list
  Future<dynamic> getMyLocations(PagingController pagingController) async {
    try {
      final response = await MyLocationService.getMyLocations();
      if (response['statusCode'] == 200) {
        final data = response['data'] as List;
        final list =
            List<Location>.from(data.map((item) => Location.fromJson(item)));
        pagingController.appendLastPage(list);
        update();
      } else {
        throw Exception('Failed to FETCH myLocations');
      }
    } catch (error) {
      update();
      throw Exception(error);
    } finally {
      update();
    }
  }

  Future<void> likeLocation(BuildContext context, Location location) async {
    try {
      final response = await LikeLocationService.likeLocation(location.no);
      final scaffold = ScaffoldMessenger.of(context);
      if (response['statusCode'] == 200) {
        likeLocations.add(location);
        update();
      } else if (response['statusCode'] == 409) {
        showToast(scaffold, '이미 좋아요한 매물입니다.');
      } else {
        showToast(scaffold, '서버에 오류가 발생하였습니다. 잠시만 기다려주세요.');
        throw Exception('Failed to FETCH LikeLocations');
      }
    } catch (error) {
      update();
      throw Exception(error);
    } finally {
      update();
    }
  }

  Future<void> unlikeLocation(BuildContext context, Location location) async {
    try {
      final response = await LikeLocationService.unlikeLocation(location.no);
      final scaffold = ScaffoldMessenger.of(context);
      if (response['statusCode'] == 200) {
        likeLocations.remove(location);
        update();
      } else if (response['statusCode'] == 409) {
        showToast(scaffold, '이미 좋아요 취소한 매물입니다.');
      } else {
        showToast(scaffold, '서버에 오류가 발생하였습니다. 잠시만 기다려주세요.');
        throw Exception('Failed to FETCH unLikeLocations');
      }
    } catch (error) {
      update();
      throw Exception(error);
    } finally {
      update();
    }
  }
}
