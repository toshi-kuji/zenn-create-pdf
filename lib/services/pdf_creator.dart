import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../data/book_data.dart';

class PdfCreator {
  static Future<Document> create() async {
    final fontData = await rootBundle.load('assets/ShipporiMincho-Regular.ttf');
    final font = Font.ttf(fontData);
    // Googleフォントを取得して埋め込むことも可能
    // final font = await PdfGoogleFonts.shipporiMinchoRegular();

    final pdf = Document(author: 'Me');

    // 表紙
    final cover = Page(
      // pageTheme設定の場合は以下2つ設定するとエラー
      // theme: ThemeData.withFont(base: font),
      // pageFormat: format,
      pageTheme: PageTheme(
        theme: ThemeData.withFont(base: font),
        pageFormat: PdfPageFormat.a4,
        orientation: PageOrientation.landscape,
        buildBackground: (context) => Opacity(
          opacity: 0.3,
          child: FlutterLogo(),
        ),
      ),
      build: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              BookData.title,
              style: Theme.of(context).header0.copyWith(fontSize: 60),
            ),
            SizedBox(height: 30),
            Text(
              BookData.author,
              style: Theme.of(context).header3,
            ),
          ],
        ),
      ),
    );

    // 本文
    final content = MultiPage(
      theme: ThemeData.withFont(base: font),
      pageFormat: PdfPageFormat.a5,
      orientation: PageOrientation.portrait,
      header: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Text(BookData.title),
        );
      },
      footer: (context) {
        return Align(
          alignment: Alignment.centerRight,
          child: Text(BookData.author),
        );
      },
      build: (context) {
        return [
          Header(
            level: 0,
            textStyle: Theme.of(context).header0,
            child: Text(
              BookData.chapter1Title,
              style: Theme.of(context).header3,
            ),
          ),
          Paragraph(
            style: Theme.of(context).paragraphStyle,
            text: BookData.chapter1Body,
          ),
          Header(
            level: 0,
            textStyle: Theme.of(context).header0,
            child: Text(
              BookData.chapter2Title,
              style: Theme.of(context).header3,
            ),
          ),
          Paragraph(
            style: Theme.of(context).paragraphStyle,
            text: BookData.chapter2Body,
          ),
          Header(
            level: 0,
            textStyle: Theme.of(context).header0,
            child: Text(
              BookData.chapter3Title,
              style: Theme.of(context).header3,
            ),
          ),
          Paragraph(
            style: Theme.of(context).paragraphStyle,
            text: BookData.chapter3Body,
          ),
        ];
      },
    );

    pdf.addPage(cover);
    pdf.addPage(content);
    return pdf;
  }
}
