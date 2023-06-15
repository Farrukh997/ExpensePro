import 'package:expense_pro/models/transaction.dart';
import 'package:expense_pro/res/app_assets.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    super.key,
    required this.item,
  });

  final Transaction item;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.only(
        left: 8.0,
        top: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.light60,
        borderRadius: BorderRadius.circular(24.0),
      ),
      height: .1.sh,
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(
            AppAssets.plan,
            height: 48.0,
            width: 48.0,
          ),
          const SizedBox(
            width: 24.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        item.title,
                        maxLines: 1,
                        softWrap: false,
                        style: AppTextStyle.titleSmallBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${item.amount < 0 ? '-' : ''}\$${item.amount < 0 ? -1 * item.amount : item.amount}',
                      style: AppTextStyle.titleSmallBold.copyWith(
                        color: item.amount < 0 ? AppColors.red100 : AppColors.green100,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        item.description,
                        style: AppTextStyle.bodySmall.copyWith(
                          color: AppColors.light20,
                        ),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${item.time.hour < 10 ? '0${item.time.hour}' : item.time.hour}:${item.time.minute}',
                      style: AppTextStyle.bodySmall.copyWith(
                        color: AppColors.light20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
