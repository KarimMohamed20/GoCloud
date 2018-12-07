class ApiURLs {
   static String baseURL="http://apimcloud.azurewebsites.net/api/";
   static String logInURL= baseURL+"Login";
   static String GOVERNATEURL= baseURL+"governerate";
   static String MEDICALSERVICEURL= baseURL+"services";
   static String GetSearch= baseURL+"vendors";
   static String About= baseURL+"about";
   static String NEAR_ME= baseURL+"nearest_v1";
   static String VISITOR_NOTIF= baseURL+"visitors_notification";
   static String VENDOR_DETAILS= baseURL+"vendor_details";
   static String PUSH_SETTINGS= baseURL+"notification_setting";
   static String RATE_CUSTOMER_SERVICE= baseURL+"rate_customer_support";
   static String RATE_VENDOR= baseURL+"rate_vendor";
   static String UPLOAD_PHOTO=baseURL+"upload_photo";
   static String EMERGENCY_NUM = baseURL+"emergency_numbers";
//   static String PAYER_VALUE = BuildConfig.PAYER_ID;
   static String PAYER_VALUE = "7";
   static String PAYER_STRING = "payer";
   static String VERIFY_MEMBER = "http://ngapis.azurewebsites.net/api/default/validatemember?memberid=%s&payer=%s";
}