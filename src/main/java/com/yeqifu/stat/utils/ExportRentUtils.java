package com.yeqifu.stat.utils;

import com.yeqifu.bus.domain.Customer;
import com.yeqifu.bus.domain.Rent;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.util.CellRangeAddress;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

/**
 * 出租单数据库导出
 */
public class ExportRentUtils {

    /**
     * 导出出租单的数据
     * @param rent
     * @param sheetName
     * @param customer
     * @return
     */
    public static ByteArrayOutputStream exportRent(Rent rent,Customer customer,String sheetName) {

        //1.组装excel文档
        //1.1创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //1.2创建样式
        HSSFCellStyle baseStyle = ExportHSSFCellStyle.createBaseStyle(workbook);
        HSSFCellStyle titleStyle = ExportHSSFCellStyle.createTitleStyle(workbook);
        //1.3在工作簿创建sheet
        HSSFSheet sheet = workbook.createSheet(sheetName);
        //1.4设置sheet
        sheet.setDefaultColumnWidth(30);
        sheet.setColumnWidth(1,50*256);
        //1.5合并
        CellRangeAddress region1 = new CellRangeAddress(0, 0, 0, 3);
        sheet.addMergedRegion(region1);

        //1.6.1创建第一行
        int index=0;
        HSSFRow row1 = sheet.createRow(index);
        //1.6.2在第一行里面创建一个单元格
        HSSFCell row1_cell1 = row1.createCell(0);
        //1.6.3设置标题样式
        row1_cell1.setCellStyle(titleStyle);
        //1.6.4设置单元格内容
        row1_cell1.setCellValue(customer.getCustname()+"的出租单信息");

        //1.7.1创建第二行
        index++;
        HSSFRow row2 = sheet.createRow(index);
        //设置行高
        row2.setHeightInPoints(150);

        HSSFCell row2_cell1 = row2.createCell(0);
        row2_cell1.setCellStyle(baseStyle);
        row2_cell1.setCellValue("出租单号：");

        HSSFCell row2_cell2 = row2.createCell(1);
        row2_cell2.setCellStyle(baseStyle);
        row2_cell2.setCellValue(rent.getRentid());

        HSSFCell row2_cell3 = row2.createCell(2);
        row2_cell3.setCellStyle(baseStyle);
        row2_cell3.setCellValue("二维码：");

        HSSFCell row2_cell4 = row2.createCell(3);
        row2_cell4.setCellStyle(baseStyle);
        row2_cell4.setCellValue("");

        InputStream logoStream = ExportCustomerUtils.class.getClassLoader().getResourceAsStream("logo.jpg");
        //画图片
        BufferedImage image = ZXingCodeEncodeUtils.createZxingCodeUseLogo(rent.getRentid(), 150, 150, logoStream);
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        try {
            ImageIO.write(image,"JPEG",bos);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //画图的顶级管理器，一个sheet只能获取一个
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();

        /**
         * 参数4  设置图片的平铺程度  最大值是255  255代表铺满当前单元格 小于255就铺不满
         * 参数5  列的开始坐标
         * 参数6  行的开始坐标
         * 参数7  列的结束坐标
         * 参数8  行的结束坐标
         */
        HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 0, 255, (short) 3, 1, (short) 4, 1);
        anchor.setAnchorType(ClientAnchor.AnchorType.DONT_MOVE_AND_RESIZE);
        patriarch.createPicture(anchor,workbook.addPicture(bos.toByteArray(),HSSFWorkbook.PICTURE_TYPE_JPEG));

        //1.7.1创建第三行
        index++;
        HSSFRow row3 = sheet.createRow(index);

        HSSFCell row3_cell1 = row3.createCell(0);
        row3_cell1.setCellStyle(baseStyle);
        row3_cell1.setCellValue("客户姓名：");

        HSSFCell row3_cell2 = row3.createCell(1);
        row3_cell2.setCellStyle(baseStyle);
        row3_cell2.setCellValue(customer.getCustname());

        HSSFCell row3_cell3 = row3.createCell(2);
        row3_cell3.setCellStyle(baseStyle);
        row3_cell3.setCellValue("身份证号：");

        HSSFCell row3_cell4 = row3.createCell(3);
        row3_cell4.setCellStyle(baseStyle);
        row3_cell4.setCellValue(customer.getIdentity());

        //1.7.1创建第四行
        index++;
        HSSFRow row4 = sheet.createRow(index);

        HSSFCell row4_cell1 = row4.createCell(0);
        row4_cell1.setCellStyle(baseStyle);
        row4_cell1.setCellValue("起租时间");

        HSSFCell row4_cell2 = row4.createCell(1);
        row4_cell2.setCellStyle(baseStyle);
        row4_cell2.setCellValue(rent.getBegindate().toLocaleString());

        HSSFCell row4_cell3 = row4.createCell(2);
        row4_cell3.setCellStyle(baseStyle);
        row4_cell3.setCellValue("还车时间：");

        HSSFCell row4_cell4 = row4.createCell(3);
        row4_cell4.setCellStyle(baseStyle);
        row4_cell4.setCellValue(rent.getReturndate().toLocaleString());

        //1.7.1创建第三行
        index++;
        HSSFRow row5 = sheet.createRow(index);

        HSSFCell row5_cell1 = row5.createCell(0);
        row5_cell1.setCellStyle(baseStyle);
        row5_cell1.setCellValue("车牌号：");

        HSSFCell row5_cell2 = row5.createCell(1);
        row5_cell2.setCellStyle(baseStyle);
        row5_cell2.setCellValue(rent.getCarnumber());

        HSSFCell row5_cell3 = row5.createCell(2);
        row5_cell3.setCellStyle(baseStyle);
        row5_cell3.setCellValue("出租价格：");

        HSSFCell row5_cell4 = row5.createCell(3);
        row5_cell4.setCellStyle(baseStyle);
        row5_cell4.setCellValue(rent.getPrice());

        //第六行 - 空行
        index++;
        //第七行
        index++;
        HSSFRow row7 = sheet.createRow(index);
        HSSFCell row7_cell3 = row7.createCell(2);
        row7_cell3.setCellStyle(baseStyle);
        row7_cell3.setCellValue("打印时间：");
        HSSFCell row7_cell4 = row7.createCell(3);
        row7_cell4.setCellStyle(baseStyle);
        row7_cell4.setCellValue(new Date().toLocaleString());

        //第八行
        index++;
        HSSFRow row8 = sheet.createRow(index);
        HSSFCell row8_cell3 = row8.createCell(2);
        row8_cell3.setCellStyle(baseStyle);
        row8_cell3.setCellValue("操作员：");
        HSSFCell row8_cell4 = row8.createCell(3);
        row8_cell4.setCellStyle(baseStyle);
        row8_cell4.setCellValue(rent.getOpername());

        //第九行
        index++;
        HSSFRow row9 = sheet.createRow(index);
        HSSFCell row9_cell3 = row9.createCell(2);
        row9_cell3.setCellStyle(baseStyle);
        row9_cell3.setCellValue("客户签名：");


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
