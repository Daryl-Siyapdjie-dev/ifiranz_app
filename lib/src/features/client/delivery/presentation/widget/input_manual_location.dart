import 'package:flutter/material.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/common_textfield.dart';

class ManualLocationDialog extends StatefulWidget {
  final Future Function(double, double) onLocationSubmitted;

  const ManualLocationDialog({super.key, required this.onLocationSubmitted});

  @override
  State<ManualLocationDialog> createState() => _ManualLocationDialogState();
}

class _ManualLocationDialogState extends State<ManualLocationDialog> {
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter Manual Location'),
              const SizedBox(
                height: 12,
              ),
              CommonTextFormField(
                controller: _latitudeController,
                textInputType:
                    const TextInputType.numberWithOptions(decimal: true),
                label: 'Latitude',
                hintText: 'Latitude',
                isLabelRequired: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CommonTextFormField(
                controller: _longitudeController,
                textInputType:
                    const TextInputType.numberWithOptions(decimal: true),
                label: 'Longitude',
                hintText: 'Longitude',
                isLabelRequired: true,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        double latitude =
                            double.tryParse(_latitudeController.text) ?? 0.0;
                        double longitude =
                            double.tryParse(_longitudeController.text) ?? 0.0;

                        if (latitude == 0 && longitude == 0) return;
                        setState(() {
                          isLoading = !isLoading;
                        });
                        widget
                            .onLocationSubmitted(latitude, longitude)
                            .whenComplete(() {
                          Navigator.of(context).pop();

                          if (mounted) {
                            setState(() {
                              isLoading = !isLoading;
                            });
                          }
                        });
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
