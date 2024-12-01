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
          'Expected Received': 'Expected Received',
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
          'Delete': 'Delete',

          "Add New Assets": "Add New Assets",
          "Create Automatic IDs": "Create Automatic IDs",
          "Order Id": "Order Id",
          "Product Id": "Product Id",
          "Product Type": "Product Type",
          "Supplier": "Supplier",
          "Reject Approve": "Reject Approve",
          "Product ID": "Product ID",
          "My Requests": "My Requests",
          "Dashboard": "Dashboard",
          "Products": "Products",
          "Storage Location": "Storage Location",
          "Product": "Product",

          'Postal Code': 'Postal Code',
          'City': 'City',
          'Country': 'Country',
          'State Or Province': 'State Or Province',
          'Supplier Name': 'Supplier Name',
          'Supplier ID': 'Supplier ID',
          'Contract Details': 'Contract Details',
          'General Supplier Details': 'General Supplier Details',
          'General Storage Details': 'General Storage Details',
          'Order Form': 'Order Form',
          'Order ID': 'Order ID',
          'Order Value': 'Order Value',
          'Contract Start Date': 'Contract Start Date',
          'Contract End Date': 'Contract End Date',
          'Location Name': 'Location Name',
          'Location ID': 'Location ID',
          'Location Type': 'Location Type',
          'Storage Details': 'Storage Details',
          'Add New Storage': 'Add New Storage',
          'Supplier Details': 'Supplier Details',
          'Add New Supplier': 'Add New Supplier',
          'Accessibility Level': 'Accessibility Level',
          'Environment Control Type': 'Environment Control Type',
          'Orders': 'Orders',
          'Order': 'Order',
          'Suppliers': 'Suppliers',
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
          'Expected Received': 'توقع الاستلام',
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
          'Delete': 'حذف',
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
          "Add New Assets": "إضافة أصول جديدة",
          "Create Automatic IDs": "إنشاء معرفات تلقائية",
          "Order Id": "معرف الطلب",
          "Product Id": "معرف المنتج",

          "Product Type": "نوع المنتج",
          "Supplier": "المورد",
          "Reject Approve": "رفض/موافقة",
          "Product ID": "معرف المنتج",
          "My Requests": "طلباتي",
          "Dashboard": "لوحة التحكم",
          "Products": "المنتجات",
          "Storage Location": "موقع التخزين",
          "Product": "منتج", 'Postal Code': 'الرمز البريدي',
          'City': 'المدينة',
          'Country': 'الدولة',
          'State Or Province': 'الولاية أو المقاطعة',
          'Supplier Name': 'اسم المورد',
          'Supplier ID': 'رقم تعريف المورد',
          'Contract Details': 'تفاصيل العقد',
          'General Supplier Details': 'تفاصيل المورد العامة',
          'General Storage Details': 'تفاصيل التخزين العامة',
          'Order Form': 'نموذج الطلب',
          'Order ID': 'رقم الطلب',
          'Order Value': 'قيمة الطلب',
          'Contract Start Date': 'تاريخ بدء العقد',
          'Contract End Date': 'تاريخ انتهاء العقد',
          'Location Name': 'اسم الموقع',
          'Location ID': 'رقم تعريف الموقع',
          'Location Type': 'نوع الموقع',
          'Storage Details': 'تفاصيل التخزين',
          'Add New Storage': 'إضافة تخزين جديد',
          'Supplier Details': 'تفاصيل المورد',
          'Add New Supplier': 'إضافة مورد جديد',
          'Accessibility Level': 'مستوى الوصول',
          'Environment Control Type': 'نوع التحكم في البيئة',
          'Orders': 'الطلبات',
          'Order': 'طلب', 'Suppliers': 'الموردين',
        },
      };
}
