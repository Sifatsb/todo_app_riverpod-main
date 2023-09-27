import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/providers/category_provider.dart';
import 'package:todo_app_riverpod/utils/utils.dart';

import 'circle_container.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = TaskCategory.values.toList();
    final selectedCategory = ref.watch(categoryProvider);
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: context.textTheme.titleLarge,
          ),
          10.horizontalSpacing,
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CircleContainer(
                    color: category.color.withOpacity(0.3),
                    child: InkWell(
                      onTap: (){
                        ref.read(categoryProvider.notifier).state = category;
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Icon(
                        category.icon,
                        color: category == selectedCategory
                            ? context.colorScheme.primary
                            : category.color,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return 8.horizontalSpacing;
                },
                itemCount: categories.length),
          ),
        ],
      ),
    );
  }
}
