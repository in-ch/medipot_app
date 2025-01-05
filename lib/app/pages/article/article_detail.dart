import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/app/views/views.dart';
import 'package:docspot_app/app/controllers/controllers.dart';

class ArticleDetailPage extends GetView<ArticleDetailController> {
  const ArticleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: PopScope(
        canPop: true,
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            iconTheme: Theme.of(context).iconTheme,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 54,
            leading: const Align(
              alignment: Alignment.centerRight,
              child: CustomBackButton(),
            ),
            title: Text("학술지 상세보기",
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          backgroundColor: Colors.white,
          body: Obx(() => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.article.titleKr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        controller.article.date,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Html(
                            data: controller.article.contentKr
                                .replaceAll('```', '')
                                .replaceAll('html', ''),
                            style: {
                              "p": Style(
                                lineHeight: const LineHeight(1.8),
                                letterSpacing: 1.5,
                                fontSize: FontSize.medium,
                              ),
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: SimpleButton(
                            text: "원본 보기",
                            color: colorScheme.primary,
                            textColor: Colors.white,
                            event: () => controller
                                .handleGoToOriginLink(controller.article.link)),
                      ),
                      const SizedBox(height: 30)
                    ],
                  ),
                )),
        ),
      ),
    );
  }
}
