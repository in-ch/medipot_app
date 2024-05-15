import 'package:flutter/material.dart';

class SearchRank extends StatelessWidget {
  const SearchRank({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: RankItem(
                    text: "검색어 1",
                    rank: 1,
                    normal: true,
                  ),
                ),
                SizedBox(
                  child: RankItem(
                    text: "검색어 2",
                    rank: 2,
                    up: true,
                  ),
                ),
                SizedBox(
                  child: RankItem(
                    text: "검색어 3",
                    rank: 3,
                    up: false,
                  ),
                ),
                SizedBox(
                  child: RankItem(
                    text: "검색어 4",
                    rank: 4,
                    normal: true,
                  ),
                ),
                SizedBox(
                  child: RankItem(
                    text: "검색어 5",
                    rank: 5,
                    up: true,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  child: RankItem(
                    text: "검색어 6",
                    rank: 6,
                    normal: false,
                  ),
                ),
                SizedBox(
                  child: RankItem(
                    text: "검색어 7",
                    rank: 7,
                    up: true,
                  ),
                ),
                SizedBox(
                  child: RankItem(
                    text: "오버플로우테스트 테스트 테스트 테스트 테스트",
                    rank: 8,
                    normal: true,
                  ),
                ),
                SizedBox(
                  child: RankItem(
                    text: "검색어 9",
                    rank: 9,
                    normal: true,
                  ),
                ),
                SizedBox(
                  child: RankItem(
                    text: "검색어 10",
                    rank: 10,
                    up: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RankItem extends StatelessWidget {
  const RankItem(
      {super.key,
      required this.rank,
      required this.text,
      this.up = false,
      this.normal = false});

  final int rank;
  final String text;
  final bool up;
  final bool normal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(children: [
        SizedBox(
          width: 20,
          child: Text(rank.toString(),
              style: Theme.of(context).textTheme.labelMedium),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 70,
          child: Text(text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium),
        ),
        const SizedBox(width: 10),
        SizedBox(
          child: Text(
              up
                  ? "up"
                  : normal
                      ? "-"
                      : "down",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: up
                      ? const Color.fromARGB(255, 255, 94, 83)
                      : normal
                          ? const Color.fromARGB(255, 103, 103, 103)
                          : const Color.fromARGB(255, 83, 143, 255))),
        ),
      ]),
    );
  }
}
