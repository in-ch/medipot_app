// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:medipot_app/app/utils/utils.dart';
import 'package:medipot_app/data/models/models.dart';
import 'package:medipot_app/services/services.dart';

class LikeLocationController extends GetxController {
  RxInt page = 0.obs;
  List<LikeLocation> likeLocations = [];

  /// [비즈니스 로직]
  /// fetch likeLocations list
  Future<dynamic> getLikeLocations(PagingController pagingController) async {
    try {
      final response = await LikeLocationService.getLikeLocations();
      if (response['statusCode'] == 200) {
        final data = response['data'] as List;
        final list = List<LikeLocation>.from(
            data.map((item) => LikeLocation.fromJson(item)));
        likeLocations.addAll(list);
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

  Future<void> likeLocation(BuildContext context, int locationNo) async {
    try {
      final response = await LikeLocationService.likeLocation(locationNo);
      final scaffold = ScaffoldMessenger.of(context);
      if (response['statusCode'] == 200) {
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

  Future<void> unlikeLocation(BuildContext context, int locationNo) async {
    try {
      final response = await LikeLocationService.unlikeLocation(locationNo);
      final scaffold = ScaffoldMessenger.of(context);
      if (response['statusCode'] == 200) {
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
