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
          'Inventory Management': 'Inventory Management',
          'All': 'All',
          'Approved': 'Approved',
          'Rejected': 'Rejected',
          'Canceled': 'Canceled',
          'Pending': 'Pending',
          'Approvals': 'Approvals',
          'Department': 'Department',
          'Job Title': 'Job Title',
          'Request Information': 'Request Information',
          'Request ID': 'Request ID',
          'Consumable ID': 'Consumable ID',
          'Request Type': 'Request Type',
          'Expected Delivery': 'Expected Delivery',
          'Return Date': 'Return Date',
          'Item Information': 'Item Information',
          'Category': 'Category',
          'Subcategory': 'Subcategory',
          "Request": "Request",
          "Not Applicable": "Not Applicable",
          "Daily": "Daily",
          "Monthly": "Monthly",
          "Annually": "Annually",
          "Requests": "Requests",
          "Consumables": "Consumables",
          "Assets": "Assets",
          'Model': 'Model',
          'Brand': 'Brand',
          'Quantity': 'Quantity',
          'Additional Details': 'Additional Details',
          'Notes and Comments': 'Notes and Comments',
          'Approval': 'Approval',
          'Reject': 'Reject',
          "Track Request": "Track Request",
          'Approve': 'Approve',
          "Download": "Download",
          "Unit Of Measurement": "Unit Of Measurement",
          "Usage Frequenc": "Usage Frequency",
          "Expiration Date": "Expiration Date",
          "Status": "Status",
          "Priority": "Priority",
          "Urgent": "Urgent",
          "High": "High",
          "Medium": "Medium",
          "Low": "Low",
          "Date Return": "Date Return",
          "Maintenance Frequency": "Maintenance Frequency",
          'Expected Recieved': 'Expected Recieved',
          "Filter": "Filter",
          'Search Here...': 'Search Here...',
          'Search By Name, Category, Subcategory, Brand, Or Model':
              'Search By Name, Category, Subcategory, Brand, Or Model',
          'Request Date': 'Request Date',
          'Last Update': 'Last Update',
          'Track Asset': 'Track Asset',
          'Asset Details': 'Asset Details',
          'Write A Comment': 'Write A Comment',
          'Inquiries And Comments': 'Inquiries And Comments',

          'Employee': 'Employee',
          'Manager': 'Manager',
          'Admin': 'Admin',
          'Approval Cycle': 'Approval Cycle',
          'Requires Approvals': 'Requires Approvals',
          'Yes': 'Yes',
          'No': 'No',
          'Cancelation': 'Cancelation',
          'Cancelation Request': 'Cancelation Request',
          'Are You sure You Want to Cancel this Request ?':
              'Are You sure You Want to Cancel this Request ?',
          'Request Delivery': 'Request Delivery',

          "Asset ID": "Asset ID",
          "Asset Name": "Asset Name",
          "Next Maintenance Schedule": "Next Maintenance Schedule",
          "Date Received": "Date Received",
          "Name": "Name",
          'Consumable Request': 'Consumable Request',
          'Asset Request': 'Asset Request', "Maintenance": "Maintenance",
          "Returned": "Returned",
          "InUse": "InUse",
          "Out Stock": "Out Stock",
          "In Stock": "In Stock",
          "Availability": "Availability",
          "SubCategory": "SubCategory",
          "Additional Notes": "Additional Notes",
          "No Data Found": "No Data Found",
          "Assets ID": "Assets ID",
          "Date Receive": "Date Receive",
        },

        // ****************************************** ARABIC LANGUAGE ******************************************
        'ar_EG': {
          // add arabic translations here

          'Inventory Management': 'إدارة المخزون',

          'All': 'الكل',
          'Approved': 'مقبول',
          'Rejected': 'مرفوض',
          'Canceled': 'ملغى',
          'Pending': 'قيد الانتظار',
          'Approvals': 'الموافقات',
          'Department': 'القسم',
          'Job Title': 'المسمى الوظيفي',
          'Request Information': 'معلومات الطلب',
          'Request ID': 'رقم الطلب',
          'Consumable ID': 'رقم المستهلك',
          "Request": "طلب",
          "Requests": "الطلبات",
          "Not Applicable": "غير قابل للتطبيق",
          'Request Type': 'نوع الطلب',
          'Expected Delivery': 'التسليم المتوقع',
          'Return Date': 'تاريخ العودة',
          'Item Information': 'معلومات العنصر',
          'Category': 'الفئة',
          'Subcategory': 'الفئة الفرعية',
          'Model': 'الموديل',
          'Brand': 'العلامة التجارية',
          'Quantity': 'الكمية',
          'Additional Details': 'تفاصيل إضافية',
          'Notes and Comments': 'ملاحظات وتعليقات',
          'Approval': 'الموافقة',
          'Reject': 'رفض',
          'Approve': 'قبول',
          "Consumables": "المواد الاستهلاكية",
          "Assets": "السلع",
          "Track Request": "تتبع الطلب",
          "Download": "تحميل",
          "Unit Of Measurement": "وحدة القياس",
          "Usage Frequency": "تكرار الاستخدام",
          "Expiration Date": "تاريخ انتهاء الصلاحية",
          "Status": "الحالة",
          "Priority": "الأولوية",
          "Urgent": "عاجل",
          "High": "عالية",
          "Medium": "متوسطة",
          "Low": "منخفضة",
          "Maintenance Frequency": "تكرار الصيانة",
          'Expected Recieved': 'توقع الاستلام',
          "Daily": "يومي",
          "Monthly": "شهري",
          "Annually": "سنوي",
          "Filter": "تصفية",
          'Search Here...': 'ابحث هنا...',
          "Request Date": "تاريخ الطلب",
          "Last Update": "آخر تحديث",
          "Track Asset": "تتبع السلعة",
          "Asset Details": "تفاصيل السلعة",
          'Search By Name, Category, Subcategory, Brand, Or Model':
              'ابحث حسب الاسم أو الفئة أو الفئة الفرعية أو العلامة التجارية أو الطراز',
          'Write A Comment': 'اكتب تعليق',
          'Inquiries And Comments': 'الاستفسارات والتعليقات',
          'Employee': 'موظف',
          'Manager': 'مدير',
          'Admin': 'مسؤول',
          'Cancelation': 'الإلغاء', "Approval Cycle": "دورة الموافقة",
          "Requires Approvals": "يتطلب موافقات",
          "Yes": "نعم",
          "No": "لا", "Cancelation Request": "طلب الإلغاء",
          "Are You sure You Want to Cancel this Request ?":
              "هل أنت متأكد أنك تريد إلغاء هذا الطلب؟",
          'Request Delivery': 'تاريخ تسليم الطلب',

          'Consumable Request': 'طلب مستهلك',
          'Asset Request': 'طلب سلعة',

          "Asset ID": "معرف الأصل",
          "Asset Name": "اسم الأصل",
          "Next Maintenance Schedule": "الجدول الزمني للصيانة القادمة",
          "Date Received": "تاريخ الاستلام",
          "Date Return": "تاريخ الإرجاع",
          "Name": "الاسم",
          "Maintenance": "الصيانة",
          "Returned": "تم الإرجاع",
          "InUse": "قيد الاستخدام",
          "Expired": "منتهي الصلاحية",
          "Out Stock": "غير متوفر",
          "In Stock": "متوفر",
          "Availability": "التوفر",
          "Additional Notes": "ملاحظات إضافية",
          "No Data Found": "لم يتم العثور على بيانات",
          "Assets ID": "معرف الأصول",
          "Date Receive": "تاريخ الاستلام",
          "Consumables Details": "تفاصيل المستهلكات",
        },
      };
}
