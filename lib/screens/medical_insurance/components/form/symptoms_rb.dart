import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';

class SymptomsRb extends StatefulWidget {
  final MedicalInsuranceFormEntities entities;
  const SymptomsRb({Key? key, required this.entities}) : super(key: key);

  @override
  State<SymptomsRb> createState() => _SymptomsRbState();
}

class _SymptomsRbState extends State<SymptomsRb> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Наличие симптомов ОРВИ:'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: RadioListTile<bool>(
                  title: const Text('есть'),
                  value: true,
                  groupValue: widget.entities.isSymptomsORVI,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  activeColor: const Color(0xff2b5e4a),
                  onChanged: (val) => setState(() {
                        widget.entities.isSymptomsORVI = val!;
                      })),
            ),
            Expanded(
              flex: 2,
              child: RadioListTile<bool>(
                  title: const Text('нет'),
                  value: false,
                  groupValue: widget.entities.isSymptomsORVI,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  activeColor: const Color(0xff2b5e4a),
                  onChanged: (val) => setState(() {
                        widget.entities.isSymptomsORVI = val!;
                      })),
            ),
            const Expanded(flex: 1, child: SizedBox.shrink())
          ],
        ),
      ],
    );
  }
}
