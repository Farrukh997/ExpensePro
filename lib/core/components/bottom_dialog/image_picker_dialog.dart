import 'package:expense_pro/core/components/icons/camera_icon.dart';
import 'package:expense_pro/core/components/icons/gallery_icon.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImagePickerSheet extends StatelessWidget {
  const ImagePickerSheet({
    super.key,
    required this.onCamera,
    required this.onGallery,
  });

  final VoidCallback onCamera;
  final VoidCallback onGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 8.0,
        right: 16.0,
        bottom: 24.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: AppColors.violet40,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 128.h,
                width: 220.w,
                child: MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: AppColors.violet20,
                  onPressed: onCamera,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Camera.camera,
                        size: 32.0,
                        color: AppColors.violet100,
                      ),
                      Text(
                        AppLocalizations.of(context)?.camera ?? AppText.camera,
                        style: AppTextStyle.bodySmall.copyWith(
                          color: AppColors.violet100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 128.h,
                width: 220.w,
                child: MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: AppColors.violet20,
                  onPressed: onGallery,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Gallery.gallery,
                        size: 32.0,
                        color: AppColors.violet100,
                      ),
                      Text(
                        AppLocalizations.of(context)?.image ?? AppText.image,
                        style:
                            AppTextStyle.bodySmall.copyWith(color: AppColors.violet100),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
