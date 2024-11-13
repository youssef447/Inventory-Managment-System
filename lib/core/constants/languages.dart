// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024
// Objectives: This file is responsible for providing the translations of the application.
// Available languages now --> English, Arabic

import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // ****************************************** ENGLISH LANGUAGE ******************************************
        'en_US': {
          // add english translations here
        //-------------------------------------------- approval -------------------
          'All' : 'All',
          'Approved' : 'Approved',
          'Rejected' : 'Rejected',
          'Canceled' : 'Canceled',
          'Approvals' : 'Approvals',
          'Department' : 'Department',
          'Job Title' : 'Job Title',
          'Request Information' : 'Request Information',
          'Request ID' : 'Request ID',
          'Request Type' : 'Request Type',
          'Expected Delivery' : 'Expected Delivery',
          'Return Date' : 'Return Date',
          'Item Information' : 'Item Information',
          'Category' : 'Category',
          'SubCategory' : 'SubCategory',
          'Model' : 'Model',
          'Brand' : 'Brand',
          'Quantity' : 'Quantity',
          'Additional Details' : 'Additional Details',
          'Notes and Comments' : 'Notes and Comments',
          'Approval' : 'Approval',
          'Reject' : 'Reject',
          'Approve' : 'Approve',


        },

        // ****************************************** ARABIC LANGUAGE ******************************************
        'ar_EG': {
          // add arabic translations here
          //-------------------------------------------- approval -------------------

          'All': 'الكل',
          'Approved': 'مقبول',
          'Rejected': 'مرفوض',
          'Canceled': 'ملغى',
          'Approvals': 'الموافقات',
          'Department': 'القسم',
          'Job Title': 'المسمى الوظيفي',
          'Request Information': 'معلومات الطلب',
          'Request ID': 'رقم الطلب',
          'Request Type': 'نوع الطلب',
          'Expected Delivery': 'التسليم المتوقع',
          'Return Date': 'تاريخ العودة',
          'Item Information': 'معلومات العنصر',
          'Category': 'الفئة',
          'SubCategory': 'الفئة الفرعية',
          'Model': 'الموديل',
          'Brand': 'العلامة التجارية',
          'Quantity': 'الكمية',
          'Additional Details': 'تفاصيل إضافية',
          'Notes and Comments': 'ملاحظات وتعليقات',
          'Approval': 'الموافقة',
          'Reject': 'رفض',
          'Approve': 'قبول',



        },
      };
}
