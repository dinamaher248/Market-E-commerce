import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../favorite/presentation/view_models/add_to_fav/add_to_fav_cubit.dart';
import '../../../../../favorite/presentation/view_models/delete_from_fav/delete_from_fav_cubit.dart';

class FavIconSec extends StatefulWidget {
  const FavIconSec(
      {super.key, this.isFavPage, this.onRemove, required this.productId});
  final bool? isFavPage; // are we on favorites page?
  final VoidCallback? onRemove;
  final String productId;

  @override
  State<FavIconSec> createState() => _FavIconSecState();
}

class _FavIconSecState extends State<FavIconSec> {
  bool isRedFav = false;

  @override
  void initState() {
    super.initState();
    isRedFav = (widget.isFavPage == true);
  }

  void _favFunc() {
    final wasFaved = isRedFav;
    setState(() => isRedFav = !isRedFav);

    if (!wasFaved && isRedFav) {
      context.read<AddToFavCubit>().addToProductCart(widget.productId);
    } else {
      context.read<DeleteFromFavCubit>().deleteProductCart(widget.productId);

      if (widget.isFavPage == true) {
        widget.onRemove?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -2,
      right: -5,
      child: IconButton(
        onPressed: _favFunc,
        icon: Icon(
          isRedFav ? Icons.favorite : Icons.favorite_outline,
          color: isRedFav
              ? Colors.red
              : Theme.of(context).brightness == Brightness.light
                  ? Colors.black45
                  : Colors.white70,
          // Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
