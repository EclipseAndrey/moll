import 'package:flutter/material.dart';

class InfoModule extends StatelessWidget {
  final String head;
  final List<String> body;
  final bool dotForBody = true;
  const InfoModule({Key? key, required this.body, required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(head, style: Theme.of(context).textTheme.headline3,),
        const SizedBox(height: 12,), ...List.generate(body.length, (index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text((dotForBody?"• ":"")+body[index], style: Theme.of(context).textTheme.bodyText2,),
      ))
      ],
    );
  }
}
