import 'package:expense_pro/presentation/components/bottom_sheet/image_picker_sheet.dart';
import 'package:expense_pro/presentation/components/buttons/primary_button.dart';
import 'package:expense_pro/presentation/components/icons/edit_icon.dart';
import 'package:expense_pro/presentation/components/icons/nav_left_icon.dart';
import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final user = FirebaseAuth.instance.currentUser;
  final picker = ImagePicker();
  final _nameTextController =
      TextEditingController(text: FirebaseAuth.instance.currentUser?.displayName ?? '');
  final _emailTextController =
      TextEditingController(text: FirebaseAuth.instance.currentUser?.email ?? '');
  late String photoURL;
  late String name;
  late String email;

  @override
  void initState() {
    super.initState();
    photoURL = '';
    name = '';
    email = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            NavLeft.arrow_left,
            color: AppColors.dark100,
            size: 32.0,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)?.editProfile ?? '',
          style: AppTextStyle.titleSmallBold,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 24.0,
              bottom: 24.0,
            ),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.violet100,
                      width: 4.0,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: getAvatar(),
                    ),
                  ),
                ),
                // CircleAvatar(
                //   radius: 72.0,
                //   backgroundColor: AppColors.blue100,
                //   foregroundColor: AppColors.red100,
                //   backgroundImage: getAvatar(),
                // ),
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: IconButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                        ),
                        // showDragHandle: true,
                        builder: (context) => ImagePickerSheet(
                          onCamera: () async {
                            final file =
                                await picker.pickImage(source: ImageSource.camera);

                            photoURL = file?.path ?? '';
                            if (mounted) Navigator.pop(context);
                          },
                          onGallery: () async {
                            final file =
                                await picker.pickImage(source: ImageSource.gallery);
                            photoURL = file?.path ?? '';
                            if (mounted) Navigator.pop(context);
                          },
                        ),
                      );
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    icon: Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.light60,
                      ),
                      child: const Icon(
                        Edit.edit,
                        size: 28.0,
                        color: AppColors.dark100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            child: TextField(
              controller: _nameTextController,
              onChanged: (value) {
                name = value;
              },
              decoration: const InputDecoration(
                hintText: 'Full Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailTextController,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)?.email ?? AppText.email,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: PrimaryButton(
              text: AppLocalizations.of(context)?.update ?? AppText.update,
              onPressed: () async {
                if (photoURL.isNotEmpty) await user?.updatePhotoURL(photoURL);
                if (name.isNotEmpty) await user?.updateDisplayName(name);
                if (email.isNotEmpty) await user?.updateEmail(email);
                if (mounted) Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider getAvatar() {
    if (user?.photoURL != null) {
      return NetworkImage(user?.photoURL ?? '');
    }
    if (photoURL.isEmpty) {
      return const NetworkImage('https://picsum.photos/400/400/');
    }
    return AssetImage(photoURL);
  }
}
