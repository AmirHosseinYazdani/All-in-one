import 'package:flutter/material.dart';
import 'package:multi_app/apps/bike_store/data_model.dart';

class ListItems extends StatelessWidget {
  final int index;
  final double imageHeight;

  const ListItems({required this.index, required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: imageHeight,
            child: Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.none, //TODO : hint : "instead of using : overflow: Overflow.visible,"
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    placeholderScale: 1.5,
                    image: DataModel.imageAssets[index],
                  ),
                ),
                Positioned(
                  right: -8,
                  top: -8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(DataModel.circleColor[index]),
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DataModel.title[index],
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                DataModel.subTitle[index],
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
