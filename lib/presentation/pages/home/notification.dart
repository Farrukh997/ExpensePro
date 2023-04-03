import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<String> _list = [];

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
            Icons.arrow_back,
            color: AppColors.dark100,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.notification ?? '',
          style: AppTextStyle.title3,
        ),
        actions: [
          PopupMenuButton(
            onSelected: (val) {
              switch (val) {
                case AppText.markAll:
                  break;
                case AppText.removeAll:
                  break;
                default:
                  break;
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                value: AppText.markAll,
                child: Text(AppLocalizations.of(context)?.seeAll ?? ''),
              ),
              PopupMenuItem(
                value: AppText.removeAll,
                child: Text(AppLocalizations.of(context)?.removeAll ?? ''),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const NotificationItem();
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
      ),
      height: size.height * .1,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shopping budget has exceeds the..',
                style: AppTextStyle.title3,
              ),
              Text(
                'Your Shopping budget has exceeds the lim....',
                style: AppTextStyle.regular1,
              ),
            ],
          ),
          Text(
            '19:30',
            style: AppTextStyle.regular1,
          ),
        ],
      ),
    );
  }
}
