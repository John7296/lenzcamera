import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/product.dart';

class QuantityUpdateWidget extends StatefulWidget {
  List<Product> productsList = [];
  int index;
  QuantityUpdateWidget(this.productsList,this.index);

  @override
  State<QuantityUpdateWidget> createState() => _QuantityUpdateWidgetState();
}

class _QuantityUpdateWidgetState extends State<QuantityUpdateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 30,
      child: widget.productsList[widget.index].isAddedtoCart()
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    DataManager.shared.updateItemToCart(
                        widget.productsList[widget.index], 4, onUpdate: () {
                      setState(() {});
                    }, onUpdateStarted: () {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xff70726f),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        )),
                    child: Center(
                        child: Icon(
                      Icons.remove,
                      color: Colors.black,
                      size: 12,
                    )),
                  ),
                ),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffe3e3e3),
                  ),
                  child: Center(
                    child: Text(
                      widget.productsList[widget.index].qty!.toStringAsFixed(0),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    DataManager.shared.updateItemToCart(
                        widget.productsList[widget.index], 3, onUpdate: () {
                      setState(() {});
                    }, onUpdateStarted: () {
                      setState(() {});
                    });
                  },
                  child: Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color(0xffe83031),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          )),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 12,
                      )),
                ),
              ],
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor:
                      (widget.productsList[widget.index].stockAvailability!.length ==
                              12)
                          ? Colors.grey.shade300
                          : Colors.yellow),
              onPressed: () {
                if (widget.productsList[widget.index].stockAvailability!.length != 12)
                  // print(popularProductsList[
                  //         index]
                  //     .urlKey);
                  DataManager.shared.updateItemToCart(
                      widget.productsList[widget.index], 1, onUpdate: () {
                    setState(() {});
                  }, onUpdateStarted: () {
                    setState(() {});
                  });
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             CartScreen()));
              },
              child: Center(
                child:
                    (widget.productsList[widget.index].stockAvailability!.length == 12)
                        ? Text(
                            "OUT OF STOCK",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Intro',
                                color: Colors.grey.shade700),
                          )
                        : Text(
                            "ADD",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Intro',
                                color: Colors.black),
                          ),
              ),
            ),
    );
  }
}
