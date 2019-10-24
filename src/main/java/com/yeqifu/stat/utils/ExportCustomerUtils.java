package com.yeqifu.stat.utils;

import com.yeqifu.bus.domain.Customer;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 客户数据库导出
 */
public class ExportCustomerUtils {

    /**
     * 导出客户数据
     * @param customers
     * @param sheetName
     * @return
     */
    public static ByteArrayOutputStream exportCustomer(List<Customer> customers, String sheetName) {

        //1.组装excel文档
        //1.1创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //1.2创建样式
        HSSFCellStyle baseStyle = ExportHSSFCellStyle.createBaseStyle(workbook);
        HSSFCellStyle subTitleStyle = ExportHSSFCellStyle.createSubTitleStyle(workbook);
        HSSFCellStyle tableTitleStyle = ExportHSSFCellStyle.createTableTitleStyle(workbook);
        HSSFCellStyle titleStyle = ExportHSSFCellStyle.createTitleStyle(workbook);
        //1.3在工作簿创建sheet
        HSSFSheet sheet = workbook.createSheet(sheetName);
        //1.4设置sheet
        sheet.setDefaultColumnWidth(25);
        //1.5合并
        CellRangeAddress region1 = new CellRangeAddress(0, 0, 0, 6);
        CellRangeAddress region2 = new CellRangeAddress(1, 1, 0, 6);
        sheet.addMergedRegion(region1);
        sheet.addMergedRegion(region2);
        //1.6.1创建第一行
        int index=0;
        HSSFRow row1 = sheet.createRow(index);
        //1.6.2在第一行里面创建一个单元格
        HSSFCell row1_cell1 = row1.createCell(0);
        //1.6.3设置标题样式
        row1_cell1.setCellStyle(titleStyle);
        //1.6.4设置单元格内容
        row1_cell1.setCellValue("客户数据列表");

        //1.7.1第二行
        index++;
        HSSFRow row2 = sheet.createRow(index);
        //1.7.2在第一行里面创建一个单元格
        HSSFCell row2_cell1 = row2.createCell(0);
        //1.7.3设置标题样式
        row2_cell1.setCellStyle(subTitleStyle);
        //1.7.4设置单元格内容
        row2_cell1.setCellValue("总条数："+customers.size()+"   导出时间："+new Date().toLocaleString());

        //1.8.1第三行
        String[] titles={"身份证号","客户姓名","客户电话","客户地址","客户职业","性别","录入时间"};
        index++;
        HSSFRow row3 = sheet.createRow(index);
        for (int i = 0; i < titles.length; i++) {
            HSSFCell row3_cell = row3.createCell(i);
            row3_cell.setCellStyle(tableTitleStyle);
            row3_cell.setCellValue(titles[i]);
        }

        //1.9第四行
        for (int i = 0; i < customers.size(); i++) {
            index++;
            Customer customer = customers.get(i);
            HSSFRow row = sheet.createRow(index);
            //1.9.1创建列客户身份证号
            HSSFCell row_identity = row.createCell(0);
            row_identity.setCellStyle(baseStyle);
            row_identity.setCellValue(customer.getIdentity());
            //1.9.1创建列客户姓名
            HSSFCell row_custname = row.createCell(1);
            row_custname.setCellStyle(baseStyle);
            row_custname.setCellValue(customer.getCustname());
            //1.9.1创建列客户电话
            HSSFCell row_phone = row.createCell(2);
            row_phone.setCellStyle(baseStyle);
            row_phone.setCellValue(customer.getPhone());
            //1.9.1创建列客户地址
            HSSFCell row_address = row.createCell(3);
            row_address.setCellStyle(baseStyle);
            row_address.setCellValue(customer.getAddress());
            //1.9.1创建列客户职业
            HSSFCell row_career = row.createCell(4);
            row_career.setCellStyle(baseStyle);
            row_career.setCellValue(customer.getCareer());
            //1.9.1创建列客户性别
            HSSFCell row_sex = row.createCell(5);
            row_sex.setCellStyle(baseStyle);
            row_sex.setCellValue(customer.getSex()==1?"男":"女");
            //1.9.1创建列客户录入时间
            HSSFCell row_createtime = row.createCell(6);
            row_createtime.setCellStyle(baseStyle);
            row_createtime.setCellValue(customer.getCreatetime().toLocaleString());
        }
        //到此excel组装完毕

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        //把workbook里面的数据写到outputStream

        try {
            workbook.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return outputStream;

    }
}
