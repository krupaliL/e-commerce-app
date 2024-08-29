import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'getAllBrands');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get all categories
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      // Extract brandIds form the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // Query to get all document where the brandId is in the list of bandIds, FieldPath.documentId to query documents in Collection
      final brandQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;

    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'getAllBrands');
      throw 'Something went wrong. Please try again';
    }
  }
}