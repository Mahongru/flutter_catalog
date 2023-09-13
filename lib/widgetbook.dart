/// A complete example for Widgetbook manual approach
///
/// Use [WidgetbookFolder],[WidgetbookComponent], and [WidgetbookUseCase]
/// to create directories
/// [Ref link]: https://docs.widgetbook.io/getting-started/complete-example
import 'package:flutter/material.dart';
import 'package:flutter_storybook/pages/pages.dart';
import 'package:widgetbook/widgetbook.dart' hide AlignmentAddon;

import 'components/components.dart';
import 'customs/customs.dart';

void main() {
  runApp(WidgetbookApp());
}

// ignore: must_be_immutable
class WidgetbookApp extends StatelessWidget {
  WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        AlignmentAddon(),
        TextScaleAddon(
          scales: [1.0, 2.0],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone12,
            Devices.ios.iPhone13,
          ],
        ),
      ],
      directories: [
        WidgetbookComponent(
          name: 'HomePage',
          useCases: [
            WidgetbookUseCase(
              name: 'Without Knobs',
              builder: (context) {
                return const HomePage(
                  title: 'Without Knobs',
                );
              },
            ),
            WidgetbookUseCase(
              name: 'With Knobs',
              builder: (context) {
                return HomePage(
                  title: context.knobs.string(
                    label: 'Title',
                    initialValue: 'With Knobs',
                  ),
                  incrementBy: context.knobs.doubleOrNull
                          .slider(
                            label: 'Increment By',
                            min: 0,
                            initialValue: 5,
                            max: 10,
                            divisions: 10,
                          )
                          ?.toInt() ??
                      0,
                  countLabel: context.knobs.stringOrNull(
                    initialValue: 'Current Count',
                    label: 'Count Label',
                    description: 'This is the text that appears '
                        'above the current count of increments',
                  ),
                  iconData: context.knobs.list(
                    label: 'Icon',
                    options: [
                      Icons.add,
                      Icons.crop_square_sharp,
                      Icons.circle,
                    ],
                  ),
                  showToolTip: context.knobs.boolean(
                    initialValue: true,
                    label: 'Show Increment Tool Tip',
                    description: 'This is the tooltip that is displayed '
                        'when hovering over the increment button',
                  ),
                );
              },
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Widgets',
          children: [
            WidgetbookComponent(
              name: 'CustomContainer',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default Style',
                  builder: (context) => greenContainerUseCase(context),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'CustomCard',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default Style',
                  builder: (context) => const CustomCard(
                    child: Text('This is a custom card'),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With Custom Background Color',
                  builder: (context) => CustomCard(
                    backgroundColor: Colors.green.shade100,
                    child: const Text(
                      'This is a custom card with a custom background color',
                    ),
                  ),
                ),
              ],
            ),
            // CustomTextField component use-cases
            WidgetbookComponent(
              name: 'CustomTextField',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default Style',
                  builder: (context) => CustomTextField(
                    controller: TextEditingController(),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With Hint Text',
                  builder: (context) => CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Enter your text here',
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'knobs',
          children: [
            WidgetbookComponent(
              name: 'RangeSlider',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => rangeSlider(context),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(name: 'Single Child layout widgets', children: [
          WidgetbookComponent(
            name: 'Mountain',
            useCases: [
              WidgetbookUseCase(
                name: 'With Hint Text',
                builder: (context) => CustomTextField(
                  controller: TextEditingController(),
                  hintText: 'Enter your text here',
                ),
              ),
              WidgetbookUseCase(
                  name: 'titleSection', builder: (context) => titleSection),
            ],
          ),
        ]),
      ],
    );
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        const Text('41'),
      ],
    ),
  );
}
