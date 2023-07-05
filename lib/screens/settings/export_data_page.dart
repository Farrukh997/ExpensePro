import 'package:expense_pro/core/components/buttons/primary_button.dart';
import 'package:expense_pro/core/components/icons/arrow_down_icon.dart';
import 'package:expense_pro/core/components/icons/nav_left_icon.dart';
import 'package:expense_pro/core/components/icons/upload_icon.dart';
import 'package:expense_pro/utils/extenstions/extensions.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ExportType {
  all,
  income,
  expense,
}

enum Formats {
  csv,
  xls,
}

class ExportDataPage extends StatelessWidget {
  const ExportDataPage({super.key});

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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)?.exportData ?? AppText.exportData,
          style: AppTextStyle.titleSmallBold,
        ),
        elevation: .3,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 24.0,
              bottom: 12.0,
            ),
            child: Text(
              AppLocalizations.of(context)?.whatDataExport ?? AppText.whatDataExport,
              style: AppTextStyle.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
            ),
            child: DropdownButtonFormField<ExportType>(
              icon: const Icon(ArrowDown.arrow_down),
              iconEnabledColor: AppColors.light20,
              items: ExportType.values
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.name.startWithCapital(),
                        style: AppTextStyle.bodyLarge,
                      )))
                  .toList(),
              onChanged: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 24.0,
              bottom: 12.0,
            ),
            child: Text(
              AppLocalizations.of(context)?.whatDateRange ?? AppText.whatDateRange,
              style: AppTextStyle.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
            ),
            child: DropdownButtonFormField<String>(
              icon: const Icon(ArrowDown.arrow_down),
              iconEnabledColor: AppColors.light20,
              items: [
                DropdownMenuItem(
                  value: 'all',
                  child: Text(
                    'Last 30 days',
                    style: AppTextStyle.bodyLarge,
                  ),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 24.0,
              bottom: 12.0,
            ),
            child: Text(
              AppLocalizations.of(context)?.whatFormatExport ?? AppText.whatFormatExport,
              style: AppTextStyle.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
            ),
            child: DropdownButtonFormField<Formats>(
              icon: const Icon(ArrowDown.arrow_down),
              iconEnabledColor: AppColors.light20,
              items: Formats.values
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.name.toUpperCase(),
                        style: AppTextStyle.bodyLarge,
                      )))
                  .toList(),
              onChanged: (value) {},
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: PrimaryButton(
              icon: const Icon(
                Upload.upload,
                size: 32.0,
                color: AppColors.light100,
              ),
              text: AppLocalizations.of(context)?.export ?? AppText.export,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
