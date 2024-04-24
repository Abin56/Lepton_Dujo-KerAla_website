import 'package:dujo_kerala_website/view/google_poppins_widget/google_poppins_widget.dart';
import 'package:dujo_kerala_website/view/web/dujo_homePage/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';
import '../text feild widget/textfeildwidget.dart';
import 'package:data_table_2/data_table_2.dart';

/// Example without a datasource
class ParentDataTable extends StatelessWidget {
  const ParentDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cWhite,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                      width: double.infinity,
                      color: cWhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: TextFontWidget(
                              text: "All Exam Results",
                              fontsize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.more_horiz),
                          ),
                        
                        ],
                      )))
            ],
          ),
     ResponsiveWebSite.isMobile(context)? SingleChildScrollView(
       child: Column(mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Padding(
                                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                                    child: SizedBox(
                                       width: double.infinity,
                                      
                                      child: TextFormFeildWidget(text: "Search Roll")),
                                  ),
                                    Padding(
                                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                                    child: SizedBox(
                                       width: double.infinity,
                                      
                                      child: TextFormFeildWidget(text: "Search Roll")),
                                  ),
                                    Padding(
                                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                                    child: SizedBox(
                                       width: double.infinity,
                                      
                                      child: TextFormFeildWidget(text: "Search Roll")),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                                    child: Container(
                                      height: 40,
                                      
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                          color: Colors.amber),
                                      child: Center(
                                          child: GooglePoppinsWidgets(
                                              text: "Search", fontsize: 16)),
                                    ),
                                  ),
       
       ],),
     ):Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                                  child: SizedBox(
                                     height: 40,
                                    
                                    child: TextFormFeildWidget(text: "Search Roll")),
                                ),
                              ),
                             Expanded(
                               child: Padding(
                                 padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                                 child: SizedBox(
                                     height: 40,
                                    
                                    child: TextFormFeildWidget(text: "Search Roll")),
                               ),
                             ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,left:10,right: 10 ),
                                  child: SizedBox(
                                     height: 40,
                                    
                                    child: TextFormFeildWidget(text: "Search Roll")),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                                  child: Container(
                                    height: 40,
                                    
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        color: Colors.amber),
                                    child: Center(
                                        child: GooglePoppinsWidgets(
                                            text: "Search", fontsize: 16)),
                                  ),
                                ),
                              ),
                            ],
                          ),
          Expanded(
            child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: const [
                  DataColumn2(
                    label: Text('ID'),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('Exam Name'),
                  ),
                  DataColumn(
                    label: Text('Subject'),
                  ),
                  DataColumn(
                    label: Text('Class'),
                  ),
                  DataColumn(
                    label: Text('Roll No'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text('Grade'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Icon(Icons.more_horiz),
                    numeric: true,
                  ),
                ],
                rows: List<DataRow>.generate(
                    10,
                    (index) => const DataRow(cells: [
                          DataCell(Text('A')),
                          DataCell(Text('B')),
                          DataCell(Text('C')),
                          DataCell(Text('D')),
                          DataCell(Text('A')),
                          DataCell(Text('B')),
                          DataCell(Icon(Icons.more_horiz)),
                        ]))),
          ),
        ],
      ),
    );
  }
}

 