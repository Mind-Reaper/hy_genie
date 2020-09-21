import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hy_genie/screens/settings_screen.dart';

class OralProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsPage(
      title: "ORAL PRODUCTS",
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).accentColor,
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).canvasColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Getting The Perfect Oral Care Products',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "◉  Toothbrushes: When buying a toothbrush, always get a soft-bristled toothbrush. Hard-bristled and even medium-bristled toothbrushes are too abrasive on your gums.\nYou can also consider an electric toothbrush, it can prevent harsh scrubbing to give better results.\nAn electric toothbrush makes brushing easier for people with health conditions that affects the hands, also get a brush with size and shape that fits your mouth well.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(height: 1.6),
                  ),
                  SizedBox(
                      height: 20,
                      width: 300,
                      child: Divider(
                        color: Colors.grey,
                      )),
                  Text(
                    "◉  Toothpaste: Choose a toothpaste that contains fluoride to strengthen tooth enamel and prevent tooth decay. Many toothpastes also have ingredients that fight tooth sensitivity, gingivitis(early-stage gum disease), bad breath or hardened plaque called 'tartar'.\n Toothpastes that have additives such as whitening agents, can break down tooth enamel.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(height: 1.6),
                  ),
                  SizedBox(
                      height: 20,
                      width: 300,
                      child: Divider(
                        color: Colors.grey,
                      )),
                  Text(
                    "◉  Dental Floss: Flossing is a must for healthy teeth, you should floss at least once a day.\nFlossing removes food particles trapped between teeth that your toothbrush misses, helping to reduce plaque and the likelihood of tooth decay and gum disease.\nDental floss comes waxed and unwaxed. If your teeth are tightly spaced, waxed floss or flossing tape may glide between them easily.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(height: 1.6),
                  ),
                  SizedBox(
                      height: 20,
                      width: 300,
                      child: Divider(
                        color: Colors.grey,
                      )),
                  Text(
                    "◉  Mouthwash: Different mouthwashes tackle different dental problems. Some help reduce plaque and prevent gingivitis, others contain fluoride to help fight cavities. Some can control or mask bad breath.\nTalk to your dentist about which mouthwash is best for you.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(height: 1.6),
                  ),
                  SizedBox(
                      height: 20,
                      width: 300,
                      child: Divider(
                        color: Colors.grey,
                      )),
                  Text(
                    "◉  Teeth Whiteners: The best way to whiten your teeth is to visit your dentist, where you can get a product with a custom fit tray.\nTeeth whiteners use peroxide solutions to actually bleach teeth. Teeth whiteners are good, but won't give you the same results as an office treatment because the peroxide solutions isn't as strong and the strips aren't customized to fit your mouth.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(height: 1.6),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
