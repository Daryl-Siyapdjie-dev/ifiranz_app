import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/products/infrastructure/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

import '../../infrastructure/utils/common_import.dart';

@RoutePage()
class ReportBugScreen extends ConsumerStatefulWidget {
  const ReportBugScreen({super.key});

  @override
  ConsumerState createState() => _ReportBugScreenState();
}

class _ReportBugScreenState extends ConsumerState<ReportBugScreen> {
  final TextEditingController comment = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(reportBugNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () {},
          data: (_) {
            showSuccessFlushbar(context, context.locale.operationSuccess);
          },
          error: (errorMessage, s) {
            showErrorFlushbar(context, errorMessage.toString());
          });
    });
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                appBar: simpleBackAndTextAppBar(context.locale.reportBug),
                body: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  children: [
                    Row(
                      children: [
                        Container(
                          width: context.proportionnalHeight(106 * 2),
                          height: context.proportionnalHeight(76 * 2),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.bgGreyLike),
                          child: image is File
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : SvgPicture.asset('assets/images/line-md_image.svg'),
                        ),
                        gapW25,
                        SizedBox(
                          width: 27,
                          height: 27,
                          child: IconButton.filled(
                            padding: EdgeInsets.zero,
                            style: IconButton.styleFrom(backgroundColor: AppColors.greyLight),
                            onPressed: () async {
                              final File? res = await showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (_) => Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                onTap: () async {
                                                  ref.read(imagePickerServiceProvider).pickImage(ImageSource.camera).then((value) {
                                                    Navigator.of(context).pop(value);
                                                  });
                                                },
                                                leading: const Icon(CupertinoIcons.camera_fill, color: AppColors.greyTextTitleColor),
                                                title: Text(
                                                  context.locale.takePicture,
                                                  style: const TextStyle(
                                                    color: AppColors.greyTextTitleColor,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                onTap: () async {
                                                  ref.read(imagePickerServiceProvider).pickImage(ImageSource.gallery).then((value) {
                                                    Navigator.of(context).pop(value);
                                                  });
                                                },
                                                leading: const Icon(CupertinoIcons.photo_fill, color: AppColors.greyTextTitleColor),
                                                title: Text(
                                                  context.locale.chooseInGallery,
                                                  style: const TextStyle(
                                                    color: AppColors.greyTextTitleColor,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20)
                                            ],
                                          ),
                                        ),
                                      ));

                              setState(() {
                                image = res;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                    gapH20,
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(
                        context.locale.giveYourFeedBack,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    gapH10,
                    TextFormField(
                      controller: comment,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: context.locale.leaveUsAComment,
                      ),
                      textInputAction: TextInputAction.done,
                      minLines: 8,
                      maxLines: 14,
                      obscureText: false,
                    ),
                    gapH20,
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 10)),
                        onPressed: image is! File
                            ? null
                            : () {
                                FocusScope.of(context).unfocus();
                                final progress = ProgressHUD.of(_);
                                progress?.show();
                                ref.read(reportBugNotifierProvider.notifier).sendReportBug(image!, comment.text.trim()).whenComplete(() {
                                  progress!.dismiss();
                                });
                              },
                        child: Text(context.locale.submit)),
                    gapH20,
                    gapH20,
                  ],
                ),
              );
            })));
  }
}
