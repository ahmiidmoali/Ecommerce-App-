import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          //language
          "1": "اختر اللغة",
          "2": "عربي",
          "3": "انجليزي",
          //boarding
          "4": "اختر المنتج",
          "5": "يوجد 100الف منتج \nاختر منتجك من\n متجرنا الالكتروني",
          "6": "الدفع آمن وسهل",
          "7": "يوجد 100الف منتج \nاختر منتجك من\n متجرنا الالكتروني",
          "8": "تعقب منتجك",
          "9": "يوجد 100الف منتج \nاختر منتجك من\n متجرنا الالكتروني",
          "9-1": "استمر",
          //signin
          "10": "تسجيل الدخول",
          "11": " اهلاً بك",
          "12": "سجل بواسطة البريد الإلكتروني",
          "13": "البريد الإلكتروني",
          "14": "ادخل البريد الإلكتروني",
          "15": "كلمة المرور",
          "16": "ادخل كلمة المرور",
          "17": "نسيت كلمة المرور",
          "18": "سجل الدخول",
          "19": " لا املك حساب",
          "20": "إنشاء حساب",
          //signup
          "21": "إنشاء حساب",
          "22": "أكمل الملف الشخصي",
          "23": "أكمل بياناتك",
          "24": "اسم المستخدم",
          "25": "ادخل اسم المستخدم",
          "26": "البريد الإلكتروني",
          "27": "ادخل البريد الإلكتروني",
          "28": "رقم الهاتف",
          "29": "ادخل رقم الهاتف",
          "30": "كلمة المرور",
          "31": "ادخل كلمة المرور",
          "32": "اشترك",
          "33": "هل تملك حساب؟",
          "34": "سجل الدخول",
          //checkmail
          "35": "رمز التحقق",
          "36":
              "ادخل الرموز الخمسة المرسلة الي بريدك الالكتروني", //successsignup
          "37": "تهانينا \n تم انشاء الحساب بنجاح",
          "38":
              "لا تكشف عن كلمة المرور الخاصة بك\nلأي شخص لتجنب التعرض لهجوم إلكتروني",
          "39": "استمر",
          //Allforgetpassword
          //forgetpassword
          "40": "نسيت كلمة المرور",
          "41": "ادخل البريد الإلكتروني",
          "42": "البريد الالكتروني المستخدم في تسجيل الحساب",
          "43": "البريد الإلكتروني",
          "44": "ادخل البريد الإلكتروني",
          "45": "ارسل",
          //verifyCode
          "46": "رمز التحقق",
          "47": "ادخل الرموز الخمسة المرسلة الي بريدك الالكتروني",
          // resetPassword
          "48": "تعيين كلمة مرور جديدة",
          "49": "يجب ان تكون 8 احرف علي الاقل",
          "50": "  كلمة المرورالجديدة",
          "51": "ادخل كلمة المرور",
          "52": " تأكيد كلمة المرور الجديدة",
          "53": "اعد ادخال كلمة المرور للتأكيد",
          "54": "تأكيد",
          //successResetPassword
          "55": "تم تغير كلمة المرور",
          "56":
              " تم تغير كلمة المرور بنجاح\n لا تكشف عن كلمة المرور الخاصة بك\n لأي شخص لتجنب أي هجوم إلكتروني",
          "57": "ارجع الي التطبيق",
        },
        "en": {
          //language
          "1": "Choose Language",
          "2": "Arabic",
          "3": "English",
          //boarding
          "4": "Choose product",
          "5":
              "we have 100k products choose \n your product from our E- \n commerce shop",
          "6": "Easy & Safe payment",
          "7":
              "we have a 100k products choose \n your product from our E- \n commerce shop.",
          "8": "Track Your Order",
          "9":
              "we have a 100k products choose \n your product from our E- \n commerce shop.",
          "9-1": "Continue",
          //signin
          "10": "Sign in",
          "11": "~~Welcome Back~~ ",
          "12": "Sign in with your email",
          "13": "Email",
          "14": "Enter your email",
          "15": "Password",
          "16": "Enter your Password",
          "17": "Forget Password",
          "18": "Sign In",
          "19": "Don't have an account? ",
          "20": "Sign Up",
          //signup
          "21": "Sign up",
          "22": "Complete Profile",
          "23": "complete your details",
          "24": "Username",
          "25": "Enter your Username",
          "26": "Email",
          "27": "Enter your email",
          "28": "Mobile",
          "29": "Enter your number",
          "30": "Password",
          "31": "Enter your Password",
          "32": "Sign Up",
          "33": " have an account? ",
          "34": "Sign In",
          //checkmail
          "35": "Verifacation Code",
          "36":
              "Enter the 5 digits code that we have sent\nthrough your e-mail", //successsignup
          "37": "Congratulations!\nyou have successfully Sign Up",
          "38":
              "Do not disclose your password\nto anyone to avoid a cyber attack",
          "39": "Continue",
          //Allforgetpassword
          //forgetpassword
          "40": "Forget Password",
          "41": "Enter Email Address",
          "42": "the email that used ith signing up ",
          "43": "Email",
          "44": "Enter your email",
          "45": "Send",
          //verifyCode
          "46": "Verifacation Code",
          "47":
              "Enter the 5 digits code that we have sent\nthrough your e-mail",
          // resetPassword
          "48": "Set New Password",
          "49": "Must be at least 8 characters",
          "50": "Password",
          "51": "Enter your password",
          "52": "Confirm Password",
          "53": "confirm your password",
          "54": "reset password",
          //successResetPassword
          "55": "Password Changed",
          "56":
              "Your password successfully changed.\nDo not disclose your password\nto anyone to avoid a cyber attack",
          "57": "Back To The App",
        }
      };
}
