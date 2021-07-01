import 'package:flutter/material.dart';
import 'package:libre/util/time.dart';

class MemberHomepage extends StatefulWidget {
  static const String id = '/member_homepage';

  const MemberHomepage({Key? key}) : super(key: key);

  @override
  _MemberHomepageState createState() => _MemberHomepageState();
}

class _MemberHomepageState extends State<MemberHomepage> {
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child: Text(
                  Time.getGreetingMessages(),
                  style: _textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  'Let\'s discover!',
                  style: _textTheme.headline4,
                ),
              ),
              Expanded(
                flex: 3,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: DefaultTabController(
                    initialIndex: 1,
                    length: 2,
                    child: Container(
                      width: 250,
                      child: Column(
                        children: [
                          RotatedBox(
                            quarterTurns: 0,
                            child: TabBar(
                              indicatorColor: Theme.of(context).accentColor,
                              indicatorWeight: 1.0,
                              tabs: [
                                Tab(
                                  child: Text(
                                    'Popular',
                                    style: _textTheme.button!.copyWith(
                                      color: Color(0xFF4f4f4f),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Newest',
                                    style: _textTheme.button!.copyWith(
                                      color: Color(0xFF4f4f4f),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: TabBarView(children: [
                              ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 250,
                                    child: RotatedBox(
                                      quarterTurns: 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          height: 150,
                                          width: 250,
                                          fadeInCurve: Curves.bounceIn,
                                          placeholder:
                                              'assets/fade_placeholder.png',
                                          image:
                                              'https://images-na.ssl-images-amazon.com/images/I/51kL+CgKRTL._SY344_BO1,204,203,200_.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 150,
                                    width: 250,
                                    child: RotatedBox(
                                      quarterTurns: 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          height: 150,
                                          width: 250,
                                          fadeInCurve: Curves.bounceIn,
                                          placeholder:
                                              'assets/fade_placeholder.png',
                                          image:
                                              'https://images-na.ssl-images-amazon.com/images/I/41pFYB7wXTL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 150,
                                width: 250,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 250,
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: FadeInImage.assetNetwork(
                                            fit: BoxFit.cover,
                                            height: 150,
                                            width: 250,
                                            fadeInCurve: Curves.bounceIn,
                                            placeholder:
                                                'assets/fade_placeholder.png',
                                            image:
                                                'https://images-na.ssl-images-amazon.com/images/I/51ojiVgJY2L._SX318_BO1,204,203,200_.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 150,
                                      width: 250,
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: FadeInImage.assetNetwork(
                                            fit: BoxFit.cover,
                                            height: 150,
                                            width: 250,
                                            fadeInCurve: Curves.bounceIn,
                                            placeholder:
                                                'assets/fade_placeholder.png',
                                            image:
                                                'https://images-na.ssl-images-amazon.com/images/I/51nVDPd094L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Discover Random Book',
                            style: _textTheme.subtitle1,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                'View All',
                                style: _textTheme.overline,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                  color: Color(0xFF4f4f4f),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                height: 150,
                                width: 100,
                                fadeInCurve: Curves.bounceIn,
                                placeholder: 'assets/fade_placeholder.png',
                                image:
                                    'https://images-na.ssl-images-amazon.com/images/I/5100eNNt32L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg',
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                height: 150,
                                width: 100,
                                fadeInCurve: Curves.bounceIn,
                                placeholder: 'assets/fade_placeholder.png',
                                image:
                                    'https://images-na.ssl-images-amazon.com/images/I/51dkUyVGeyL._SX331_BO1,204,203,200_.jpg',
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                height: 150,
                                width: 100,
                                fadeInCurve: Curves.bounceIn,
                                placeholder: 'assets/fade_placeholder.png',
                                image:
                                    'https://images-na.ssl-images-amazon.com/images/I/51itAvYF-UL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg',
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                height: 150,
                                width: 100,
                                fadeInCurve: Curves.bounceIn,
                                placeholder: 'assets/fade_placeholder.png',
                                image:
                                    'https://images-na.ssl-images-amazon.com/images/I/51VGtPV-tIL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      /*
        INFORMATION!
        The FAB is for experiment only!
       */
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
