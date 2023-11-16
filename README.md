# Sadad Payment Integration Plugin

A Flutter plugin for integrating the Sadad payment SDK into your Flutter app.  
This plugin provides a wrapper for the native [Sadad payment SDKs](https://developer.sadad.qa),   
allowing you to use them in your Flutter project.
<br>

# Getting Started

To use the Sadad Flutter plugin in your project, you'll need to create a Sadad account and integrate your backend  
Here's how:

1. Create a Sadad account and obtain your **merchantId**,**secretKey**
2. Integrate the Sadad backend into your system by following the integration guide provided by Sadad.
3. Obtain a transaction token from the Sadad server by calling the appropriate API endpoint from your backend **[See Application SDK Section](https://developer.sadad.qa)**

### Once you obtain the transaction token you are good to go

<br>

![Alt Text](https://raw.githubusercontent.com/a3bd2lra7man/sadad_flutter_sdk/main/ezgif.com-optimize.gif)

<br>

# Usage

1. Add sadad_flutter_sdk to your pubspec.yaml file:
```yaml
dependencies:
  sadad_flutter_sdk: ^0.0.5
```
2. Import the package into your code:
```dart
import 'package:sadad_flutter_sdk/sadad_flutter_sdk.dart';
```
3. Create a SadadTransaction object with the required parameters:
```dart
var transaction = SadadTransaction(
  email: "a3bd2llah@gmail.com",
  mobileNumber: "97431487378",
  customerId: "123456789",
  clientToken: "put the obtained token here", //  PUT THE OBTAINED TOKEN HERE
  transactionAmount: "10000.0",
  orderItems: [const SadadOrderItem(name: "top up", quantity: 1, amount: 10000)],
  orderId: "123456789",
);
```
**Here, clientToken is the token obtained from Sadad.**

4. Call the createTransaction method to initiate the payment process:
```dart
String result;

final sadadFlutterSdkPlugin = SadadFlutterSdk();
try {
  result = await _sadadFlutterSdkPlugin.createTransaction(transaction) ?? 'null';
} on PlatformException {
  result = 'Platform Exception';
}
```
The result should contain the transaction number if the transaction completed(**failed** or **succeed**).  
However, it's possible for the result to be null in certain scenarios:

If there was an error with the API Calling, the result may be null.  
If the transaction data is not in the correct format, the result may be null.  
If the user cancels the transaction, the result may be null.


Now You have the Sadad SDK soluation in your flutter app

***If you find this Sadad Flutter SDK plugin useful, please consider giving it a star on [GitHub](https://github.com/a3bd2lra7man/sadad_flutter_sdk) to show your support. Your feedback and suggestions are also welcome!***

<br>

> **Note:**  Please be aware that the Sadad Flutter SDK plugin will not work on iOS simulator due to limitations of the Sadad SDK.
If you need to test your app on an iOS simulator, you can use the [sadad_flutter_ios_simulator](https://pub.dev/packages/sadad_flutter_ios_simulator) plugin, which provides a simulated environment for Sadad payment integration on iOS simulator.  
To use sadad_flutter_ios_simulator plugin, you can use the same example code provided here, but with the following import statement:
```dart
import 'package:sadad_flutter_ios_simulator/sadad_flutter_ios_simulator.dart';
```
<br>

> **Note:** Please note that if you use both the sadad_flutter_sdk and sadad_flutter_ios_simulator packages in your app at the same time, you will encounter a package naming conflict error on iOS. Therefore, you can only use one of these packages at a time, depending on your testing and deployment needs.

<br>
<br>
