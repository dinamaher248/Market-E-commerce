import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/image_widget/fav_icon_sec.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/image_widget/image_sec.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/image_widget/offer_sec.dart';

class ImageWidget extends StatefulWidget {
  ImageWidget({
    super.key,
    this.productImage,
    this.imageHight,
    required this.imageWidth,
    this.IsOffer,
    this.isFav,
    this.isFavPage,
    this.isAdd,
    required this.nameProduct,
    required this.productId,
    this.onRemove,
  });
  String? productImage;
  double imageWidth;
  double? imageHight;
  bool? IsOffer = false;
  bool? isFav; // show icon or not
  final bool? isFavPage; // are we on favorites page?
  bool? isAdd;
  String nameProduct;
  final String productId;
  final VoidCallback? onRemove;
  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  bool isRedFav = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageSec(widget: widget),
        if (widget.IsOffer == true) const OfferSec(),
        if (widget.isFav == true)
          FavIconSec(
              productId: widget.productId,
              isFavPage: widget.isFavPage,
              onRemove: widget.onRemove),
      ],
    );
  }
}
