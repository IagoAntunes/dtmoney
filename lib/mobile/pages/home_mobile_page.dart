import 'package:dtmoney/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({Key? key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  TextEditingController controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // mobilehomeY5R (42020:1622)
        width: double.infinity,
        height: 2065 * fem,
        decoration: BoxDecoration(
          color: Color(0xff202024),
        ),
        child: Stack(
          children: [
            Positioned(
              // autogroup2yyxNaF (8c12j5EMzefjEXXcJ12yYX)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                width: 896 * fem,
                height: 284 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // backgroundoQf (42020:1718)
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 375 * fem,
                          height: 200 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff121214),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // pageheaderqcF (42020:1729)
                      left: 27 * fem,
                      top: 56 * fem,
                      child: Container(
                        width: 324 * fem,
                        height: 38 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // logoK1d (42020:1730)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 7.5 * fem, 84.26 * fem, 7.37 * fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // ignitesimboloBh (42020:1731)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 9 * fem, 0 * fem),
                                    width: 24 * fem,
                                    height: 23.13 * fem,
                                    child: Image.asset(
                                      'assets/projeto/images/ignite-simbol.png',
                                      width: 24 * fem,
                                      height: 23.13 * fem,
                                    ),
                                  ),
                                  Container(
                                    // dtmoneyTGF (42020:2223)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 1.63 * fem),
                                    width: 76.74 * fem,
                                    height: 16 * fem,
                                    child: Image.asset(
                                      'assets/projeto/images/dt-money-62f.png',
                                      width: 76.74 * fem,
                                      height: 16 * fem,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              // buttonsmiCB (42020:1737)
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 130 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff00875f),
                                  borderRadius: BorderRadius.circular(6 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Nova transação',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // dashboard5gw (42020:1738)
                      left: 24 * fem,
                      top: 134 * fem,
                      child: Container(
                        width: 872 * fem,
                        height: 150 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // cardmobileuR5 (42020:2954)
                              padding: EdgeInsets.fromLTRB(
                                  32 * fem, 24 * fem, 24 * fem, 23 * fem),
                              width: 280 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff323238),
                                borderRadius: BorderRadius.circular(6 * fem),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // headerxu9 (42020:2932)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 12 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 3 * fem, 0 * fem),
                                    width: double.infinity,
                                    height: 32 * fem,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // entradas1cX (42020:2933)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 132 * fem, 6 * fem),
                                          child: Text(
                                            'Entradas',
                                          ),
                                        ),
                                        Container(
                                          // icons5ko (42020:2934)
                                          width: 26 * fem,
                                          height: 26 * fem,
                                          child: Image.asset(
                                            'assets/projeto/images/icons-q8F.png',
                                            width: 26 * fem,
                                            height: 26 * fem,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // frame1wo1 (42020:2955)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 41 * fem, 0 * fem),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // r1740000Cyq (42020:2935)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 2 * fem),
                                          child: Text(
                                            'R\$ 17.400,00',
                                          ),
                                        ),
                                        Text(
                                          // ltimaentradaem13deabrilr2o (42020:2956)
                                          'Última entrada em 13 de abril',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 16 * fem,
                            ),
                            Container(
                              // cardmobilesib (42020:2959)
                              padding: EdgeInsets.fromLTRB(
                                  32 * fem, 24 * fem, 24 * fem, 23 * fem),
                              width: 280 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff323238),
                                borderRadius: BorderRadius.circular(6 * fem),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // headerhhd (I42020:2959;42020:2932)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 12 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 3 * fem, 0 * fem),
                                    width: double.infinity,
                                    height: 32 * fem,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // entradasxdZ (I42020:2959;42020:2933)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 146 * fem, 6 * fem),
                                          child: Text(
                                            'Saídas',
                                          ),
                                        ),
                                        Container(
                                          // iconsci7 (I42020:2959;42020:2934)
                                          width: 26 * fem,
                                          height: 26 * fem,
                                          child: Image.asset(
                                            'assets/projeto/images/icons-ZuM.png',
                                            width: 26 * fem,
                                            height: 26 * fem,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // frame1H3Z (I42020:2959;42020:2955)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 54 * fem, 0 * fem),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // r1740000Zmm (I42020:2959;42020:2935)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 2 * fem),
                                          child: Text(
                                            'R\$ 1.259,00',
                                          ),
                                        ),
                                        Text(
                                          // ltimaentradaem13deabrilpxb (I42020:2959;42020:2956)
                                          'Última saída em 10 de abril',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 16 * fem,
                            ),
                            Container(
                              // cardmobileVYw (42020:2978)
                              padding: EdgeInsets.fromLTRB(
                                  32 * fem, 24 * fem, 24 * fem, 23 * fem),
                              width: 280 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff015f43),
                                borderRadius: BorderRadius.circular(6 * fem),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // headerkUs (I42020:2978;42020:2932)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 12 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 7 * fem, 0 * fem),
                                    width: double.infinity,
                                    height: 32 * fem,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // entradasdHm (I42020:2978;42020:2933)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 163 * fem, 0 * fem),
                                          child: Text(
                                            'Total',
                                          ),
                                        ),
                                        Container(
                                          // iconsTGo (I42020:2978;42020:2934)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              2 * fem, 0 * fem, 0 * fem),
                                          width: 18 * fem,
                                          height: 28 * fem,
                                          child: Image.asset(
                                            'assets/projeto/images/icons-bCw.png',
                                            width: 18 * fem,
                                            height: 28 * fem,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // frame1iTd (I42020:2978;42020:2955)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 59 * fem, 0 * fem),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // r1740000DfH (I42020:2978;42020:2935)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 2 * fem),
                                          child: Text(
                                            'R\$ 16.141,00',
                                          ),
                                        ),
                                        Text(
                                          // ltimaentradaem13deabril5xP (I42020:2978;42020:2956)
                                          'De 15/03/22 até 13/04/22',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // autogroupa11mZsZ (8c13f8WdATwmJU1rS8a11M)
              left: 0 * fem,
              top: 284 * fem,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(24 * fem, 24 * fem, 24 * fem, 70 * fem),
                width: 375 * fem,
                height: 1781 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // listCfd (42020:1719)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 32 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // titlefp7 (42020:2860)
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // transaeszLb (42020:2861)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 185 * fem, 0 * fem),
                                  child: Text(
                                    'Transações',
                                  ),
                                ),
                                Text(
                                  // itens45Z (42020:2862)
                                  '4 itens',
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12 * fem,
                          ),
                          Container(
                            // searchivo (42078:600)
                            width: double.infinity,
                            height: 54 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // textfieldbjh (42078:601)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 8 * fem, 0 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      16 * fem, 16 * fem, 16 * fem, 15 * fem),
                                  width: 265 * fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xff121214),
                                    borderRadius:
                                        BorderRadius.circular(6 * fem),
                                  ),
                                  child: Text(
                                    'Busque uma transação',
                                  ),
                                ),
                                Container(
                                  // searchuto (42078:664)
                                  padding: EdgeInsets.fromLTRB(17.72 * fem,
                                      17.72 * fem, 17.72 * fem, 17.72 * fem),
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xff00b37e)),
                                    borderRadius:
                                        BorderRadius.circular(6 * fem),
                                  ),
                                  child: Center(
                                    // iconsKxX (42078:665)
                                    child: SizedBox(
                                      width: 18.56 * fem,
                                      height: 18.56 * fem,
                                      child: Image.asset(
                                        'assets/projeto/images/icons-TX9.png',
                                        width: 18.56 * fem,
                                        height: 18.56 * fem,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // iphoneenf (42020:1643)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 375 * fem,
                  height: 2065 * fem,
                  child: Image.asset(
                    'assets/projeto/images/iphone-7B1.png',
                    width: 375 * fem,
                    height: 2065 * fem,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
