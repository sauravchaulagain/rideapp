// import 'package:flutter/material.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.root:
//         return MaterialPageRoute(
//           builder: (_) => const SplashScreens(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.onboarding:
//         return MaterialPageRoute(
//           builder: (_) => OnboardPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.internetList:
//         return MaterialPageRoute(
//           builder: (_) => InternetListScreen(),
//           settings: RouteSettings(name: settings.name),
//         );

//       case Routes.allServicesDashboard:
//         return MaterialPageRoute(
//           builder: (_) => const AllCategoryScreen(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.sendMoney:
//         return MaterialPageRoute(
//           builder: (_) => const SendMoneyPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.anyBank:
//         return MaterialPageRoute(
//           builder: (_) => const AnyBankpage(),
//           settings: RouteSettings(name: settings.name),
//         );

//       case Routes.profileScreen:
//         return MaterialPageRoute(
//           builder: (_) => const ProfilePage(),
//           settings: RouteSettings(name: settings.name),
//         );

//       case Routes.internalCooperative:
//         return MaterialPageRoute(
//           builder: (_) => const InternalCooperativePage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.otherCooperative:
//         return MaterialPageRoute(
//           builder: (_) => const OtherCooperativePage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.reveiveMoney:
//         return MaterialPageRoute(
//           builder: (_) => const ReceiveMoneyPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.mobileBanking:
//         return MaterialPageRoute(
//           builder: (_) => const MobileBankingPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.connectIps:
//         return MaterialPageRoute(
//           builder: (_) => const ConnectIpsPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.loadViaCard:
//         return MaterialPageRoute(
//           builder: (_) => const LoadViaCardPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.internetbanking:
//         return MaterialPageRoute(
//           builder: (_) => const InternetBankingPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.requestSapati:
//         return MaterialPageRoute(
//           builder: (_) => const RequestSapatiPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.statementPage:
//         return MaterialPageRoute(
//           builder: (_) => const StatementPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.balanceInquiry:
//         return MaterialPageRoute(
//           builder: (_) => const BalanceInquiryWidget(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.chequeScreen:
//         return MaterialPageRoute(
//           builder: (_) => const ChequePage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.emiCalculator:
//         return MaterialPageRoute(
//           builder: (_) => EmiCalculatorPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.discountCalculator:
//         return MaterialPageRoute(
//           builder: (_) => DiscountCalculatorPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.loginPage:
//         return MaterialPageRoute(
//           builder: (_) => LoginPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.listWalletScreen:
//         return MaterialPageRoute(
//           builder: (_) => const WalletTransferScreen(),
//           settings: RouteSettings(name: settings.name),
//         );

//       case Routes.buyDatapack:
//         return MaterialPageRoute(
//           builder: (_) => const BuyDatapackScreen(),
//           settings: RouteSettings(name: settings.name),
//         );

//       case Routes.chooseAccountFullStatement:
//         return MaterialPageRoute(
//           builder: (_) => const ChooseAccountFullStatementPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.fullStatement:
//         return MaterialPageRoute(
//           builder: (_) => FullStatementPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.chooseAccountMiniStatement:
//         return MaterialPageRoute(
//           builder: (_) => const ChooseAccountMiniStatementPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.miniStatement:
//         return MaterialPageRoute(
//           builder: (_) => const MiniStatementPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.downloadScreen:
//         return MaterialPageRoute(
//           builder: (_) => const DownloadPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.forgotPin:
//         return MaterialPageRoute(
//           builder: (_) => const ResetPinPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.settingPage:
//         return MaterialPageRoute(
//           builder: (_) => const SettingPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.loanPage:
//         return MaterialPageRoute(
//           builder: (_) => const LoanPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.loanInformationPage:
//         return MaterialPageRoute(
//           builder: (_) => const LoanInfoChooseAccountPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.loanSchedulePage:
//         return MaterialPageRoute(
//           builder: (_) => const LoanScheduleChooseAccountPage(),
//           settings: RouteSettings(name: settings.name),
//         );
//       case Routes.loanStatementPage:
//         return MaterialPageRoute(
//           builder: (_) => const LoanStatementChooseAccountPage(),
//           settings: RouteSettings(name: settings.name),
//         );

//       default:
//         return MaterialPageRoute(
//           builder: (_) => const SplashScreens(),
//           settings: RouteSettings(name: settings.name),
//         );
//     }
//   }
// }
