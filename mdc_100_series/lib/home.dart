// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<Card> buildCards(BuildContext context) {
    List<Product> products=ProductsRepository.loadProducts(Category.all);
    if (products.isEmpty) {
      return const <Card>[];
    }
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return List.generate(
        products.length,
        (index) => Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 25.0 / 15.0,
                      child: Image.asset(products[index].assetName,package: products[index].assetPackage,fit: BoxFit.fill,),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(products[index].name),
                   SizedBox(height: 8.0),
                   Text( products[index].price.toString() + ' L.E' ),
                ],
              ),
            ));
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHRINE'),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30.0,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30.0,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune,
                size: 30.0,
              )),
        ],
      ),
      body: GridView.count(
        padding: EdgeInsets.all(8.0),
        crossAxisCount: 2,
        children: buildCards(context),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
