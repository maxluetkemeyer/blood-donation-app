import 'dart:convert';

import 'package:blooddonation/faq/html.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'faq_question_widget.dart';
import '../models/faq_question_model.dart';
import 'faq_question_list.dart';

///This Widget is used, to show the user the faq interface.
class FaqView extends StatefulWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  ///Build method to build the faq page, utilizing the [faqQuestionList] which is a list of [FaqQuestion]'s.
  ///
  ///Returns a [Widget] tree.
  @override
  Widget build(BuildContext context) {
    final qList = faqQuestionList(context);

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ExpansionPanelList.radio(
            elevation: 3,
            animationDuration: const Duration(milliseconds: 600),
            children: [
              ExpansionPanelRadio(
                value: "tesst",
                canTapOnHeader: true,
                headerBuilder: (_, isExpanded) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: const Text("Test"),
                ),
                body: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  //width: 100,
                  height: 500,
                  child: WebView(
                    javascriptMode: JavascriptMode.disabled,
                    onWebViewCreated: (controller) {
                      controller.loadHtmlString(htmlData);
                    },
                    zoomEnabled: false,
                  ),
                ),
              ),
              for (var i in qList)
                FaqQuestionWidget(
                  question: i,
                  key: ValueKey(i),
                ).create(),
            ],
          ),
        ],
      ),
    );
  }
}
