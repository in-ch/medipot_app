import 'package:flutter/material.dart';

import 'package:docspot_app/app/style/theme.dart';
import 'package:docspot_app/data/models/models.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.message,
    required this.isMy,
    required this.formattedTime,
    required this.longPressFuc,
  });

  final ChatMessage message;
  final bool isMy;
  final String formattedTime;
  final Function longPressFuc;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isMy
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        message.profile.toString(),
                      ),
                    ),
                  ),
                ),
              ),
        Expanded(
          child: Column(
            crossAxisAlignment:
                isMy ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              isMy
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          message.author,
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
              GestureDetector(
                onLongPress: () => message.img != null
                    ? debugPrint('image message long pressed!')
                    : longPressFuc(context, message, message.img == null),
                child: Align(
                  alignment:
                      isMy ? Alignment.centerRight : Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: isMy
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        padding: EdgeInsets.all(message.img != null ? 0 : 10),
                        decoration: BoxDecoration(
                          color: isMy
                              ? colorScheme.primary
                              : const Color.fromARGB(255, 56, 56, 56),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: message.img != null
                            ? GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierColor: Colors.black87,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: Container(
                                          margin: const EdgeInsets.all(20),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              message.img!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    width: 180,
                                    child: Image.network(
                                      message.img!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : Text(
                                message.body,
                                style: const TextStyle(color: Colors.white),
                              ),
                      ),
                      Padding(
                        padding: isMy
                            ? const EdgeInsets.only(right: 20.0)
                            : const EdgeInsets.only(left: 20.0),
                        child: Text(
                          formattedTime,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
