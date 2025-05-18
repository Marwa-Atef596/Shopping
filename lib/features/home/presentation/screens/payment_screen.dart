import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme.dart';
import '../../../../core/utils/text_utils.dart';
import '../../logic/controller/cart_controller.dart';
import '../widgets/delivery_continer_widget.dart';
import '../widgets/pay_ment_method_widget.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.black : mainColor,
        title: TextUtils(
            text: 'PayMent',
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                text: "Shipping to",
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const DeliveryContinerWidget(),
              const SizedBox(
                height: 20,
              ),
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                text: "Payment method",
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const PayMentMethodWidget(),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: "Total: ${cartController.total} \$",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: mainColor,
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Pay Now",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // GetBuilder<PayMentController>(
              //   builder: (_) {
              //     if (payMentController.paymentItems.isNotEmpty) {
              //       return Center(
              //         child: GooglePayButton(
              //           width: 200,
              //           height: 50,
              //           paymentConfigurationAsset: 'gpay.json',
              //           paymentItems: payMentController.paymentItems,
              //           style: GooglePayButtonStyle.black,
              //           type: GooglePayButtonType.pay,
              //           margin: const EdgeInsets.only(top: 15.0),
              //           onPaymentResult: (data) {
              //             print(data);
              //           },
              //           loadingIndicator: const Center(
              //             child: CircularProgressIndicator(),
              //           ),
              //         ),
              //       );
              //     } else {
              //       return Center(
              //         child: SizedBox(
              //           height: 50,
              //           width: 150,
              //           child: ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               elevation: 0,
              //               primary: Get.isDarkMode ? pinkClr : mainColor,
              //             ),
              //             onPressed: () {},
              //             child: const Text(
              //               "Pay Now",
              //               style: TextStyle(
              //                 fontSize: 22,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     }
              //   },
              // ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
