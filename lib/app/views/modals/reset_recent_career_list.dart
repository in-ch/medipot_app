import 'package:flutter/material.dart';

import 'package:docspot_app/app/style/theme.dart';

class ResetRecentCareerList extends StatefulWidget {
  const ResetRecentCareerList({super.key, required this.onTap});

  final void Function() onTap;

  @override
  State<ResetRecentCareerList> createState() => _ResetRecentCareerListState();
}

class _ResetRecentCareerListState extends State<ResetRecentCareerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 220, 220, 220),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "최근 본 포지션을 지우겠습니까?",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 5),
            Text(
              "삭제된 내역은 복구되지 않습니다.",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: colorScheme.primary),
                  onPressed: widget.onTap,
                  child: Text('확인',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: colorScheme.primary),
                      )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('취소',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: colorScheme.primary)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
