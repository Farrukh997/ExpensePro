import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/domain/models/notification_model.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum NotificationActions { markAll, removeAll }

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<String> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            NavLeft.arrow_left,
            size: 32.0,
            color: AppColors.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.notification ?? AppText.notification,
          style: AppTextStyle.titleSmallBold,
        ),
        actions: <Widget>[
          PopupMenuButton<NotificationActions>(
            icon: const Icon(
              Icons.more_horiz,
              color: AppColors.dark100,
            ),
            onSelected: (val) {
              switch (val) {
                case NotificationActions.markAll:
                  break;
                case NotificationActions.removeAll:
                  break;
                default:
                  break;
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<NotificationActions>>[
              PopupMenuItem(
                value: NotificationActions.markAll,
                child: Text(
                  AppLocalizations.of(context)?.seeAll ?? AppText.seeAll,
                ),
              ),
              PopupMenuItem(
                value: NotificationActions.removeAll,
                child: Text(
                  AppLocalizations.of(context)?.removeAll ?? AppText.removeAll,
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => NotificationItem(
          notification: NotificationModel(
            title: '',
            message: '',
            time: DateTime.now(),
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
      ),
      height: .1.sh,
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  notification.title,
                  style: AppTextStyle.titleSmallBold,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  notification.message,
                  style: AppTextStyle.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            '${notification.time.hour}:${notification.time.minute}',
            style: AppTextStyle.bodyLarge,
          ),
        ],
      ),
    );
  }
}
