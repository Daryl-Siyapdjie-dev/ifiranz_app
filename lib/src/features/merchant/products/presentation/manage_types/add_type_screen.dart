import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/common_textfield.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_request.dart';
import 'package:ifiranz_client/src/features/merchant/products/shared/types_providers.dart';

import '../../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class AddTypeScreen extends StatefulHookConsumerWidget {
  const AddTypeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTypeScreenState();
}

class _AddTypeScreenState extends ConsumerState<AddTypeScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final name = useTextEditingController();
    final nameFocus = useFocusNode();
    final code = useTextEditingController();
    final codeFocus = useFocusNode();

    ref.listen(merchandTypesNotifierProvider, (prev, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (res) {
            if (res.actionError is String) {
              return showErrorFlushbar(context, res.actionError!);
            } else if (res.actionError == null &&
                prev?.value?.data.length != next.value?.data.length) {
              showSuccessFlushbar(context, 'Operation successful');
            }
          },
          error: (e, s) {
            showErrorFlushbar(context, e.toString());
          });
    });

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                  appBar: const CustomMarchandAppBar(
                    title: 'Add Type',
                  ),
                  body: Form(
                    key: _formKey,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        gapH20,
                        CommonTextFormField(
                          controller: name,
                          focusNode: nameFocus,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          hintText: 'Name',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: true,
                          hasLabel: true,
                          validator: ref
                              .read(formValidationServiceProvider)
                              .validateSimple,
                          label: 'Name',
                          obscureText: false,
                        ),
                        gapH20,
                        CommonTextFormField(
                          controller: code,
                          focusNode: codeFocus,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          hintText: 'Code',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          isLabelRequired: true,
                          hasLabel: true,
                          validator: ref
                              .read(formValidationServiceProvider)
                              .validateSimple,
                          label: 'Code',
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final progress = ProgressHUD.of(_);
                            progress?.show();

                            ref
                                .read(merchandTypesNotifierProvider.notifier)
                                .createType(TypeRequest(
                                    designation: name.text.trim(),
                                    code: code.text.trim()))
                                .whenComplete(() => progress?.dismiss());
                          }
                        },
                        child: const Text('Create')),
                  ));
            })));
  }
}
