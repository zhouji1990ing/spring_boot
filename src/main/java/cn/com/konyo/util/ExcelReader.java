//package cn.com.konyo.util;
//
//import java.io.IOException;
//import java.io.InputStream;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Map;
//
//import org.apache.poi.hssf.usermodel.HSSFCell;
//import org.apache.poi.hssf.usermodel.HSSFDataFormat;
//import org.apache.poi.hssf.usermodel.HSSFDateUtil;
//import org.apache.poi.hssf.usermodel.HSSFRow;
//import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//
//import org.apache.poi.ss.usermodel.Cell;
//
//import org.apache.poi.poifs.filesystem.POIFSFileSystem;
//
///**
// * ����Excel���Ĺ�����
// * 
// * @author salcon
// * @version 1.0
// */
//public class ExcelReader {
//	private POIFSFileSystem fs;
//
//	private HSSFWorkbook wb;
//
//	private HSSFSheet sheet;
//
//	private HSSFRow row;
//
//	/**
//	 * ��ȡExcel����ͷ������
//	 * 
//	 * @param InputStream
//	 * @return String ��ͷ���ݵ�����
//	 * 
//	 */
//	public String[] readExcelTitle(InputStream is) {
//		try {
//			fs = new POIFSFileSystem(is);
//			wb = new HSSFWorkbook(fs);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		sheet = wb.getSheetAt(0);
//		row = sheet.getRow(0);
//		// ����������
//		int colNum = row.getPhysicalNumberOfCells();
//		String[] title = new String[colNum];
//		for (int i = 0; i < colNum; i++) {
//			title[i] = getStringCellValue(row.getCell(i));
//		}
//		return title;
//	}
//
//	/**
//	 * ��ȡExcel�������
//	 * 
//	 * @param InputStream
//	 * @return Map ��Ԫ��������ݵ�Map����
//	 */
//	public Map<Integer, String> readExcelContent(InputStream is) {
//		Map<Integer, String> content = new HashMap<Integer, String>();
//		String str = "";
//		try {
//			fs = new POIFSFileSystem(is);
//			wb = new HSSFWorkbook(fs);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		sheet = wb.getSheetAt(0);
//		// �õ�������
//		int rowNum = sheet.getLastRowNum();
//		row = sheet.getRow(0);
//		int colNum = row.getPhysicalNumberOfCells();
//		// ��������Ӧ�ôӵڶ��п�ʼ,��һ��Ϊ��ͷ�ı���
//		for (int i = 1; i <= rowNum; i++) {
//			row = sheet.getRow(i);
//			int j = 0;
//			while (j < colNum) {
//				// ÿ����Ԫ������������"-"�ָ���Ժ���Ҫʱ��String���replace()������ԭ���
//				// Ҳ���Խ�ÿ����Ԫ���������õ�һ��javabean�������У���ʱ��Ҫ�½�һ��javabean
//				str += getStringCellValue(row.getCell(j)).trim() + "$~$";
//				j++;
//			}
//			str = str.substring(0,str.lastIndexOf("$~$"));
//			content.put(i, str);
//			str = "";
//		}
//		return content;
//	}
//
//	/**
//	 * ��ȡ��Ԫ���������Ϊ�ַ����͵����
//	 * 
//	 * @param cell
//	 *            Excel��Ԫ��
//	 * @return String ��Ԫ���������
//	 */
//	public static String getStringCellValue(Cell cell) {
//		String strCell = "";
//		if (cell == null)
//			return "";
//		switch (cell.getCellType()) {
//		case Cell.CELL_TYPE_STRING:
//			strCell = cell.getStringCellValue();
//			break;
//		case Cell.CELL_TYPE_NUMERIC:
//			strCell = getDate(cell);
//			break;
//		case Cell.CELL_TYPE_BOOLEAN:
//			strCell = String.valueOf(cell.getBooleanCellValue());
//			break;
//		case Cell.CELL_TYPE_BLANK:
//			strCell = "";
//			break;
//		default:
//			strCell = "";
//			break;
//		}
//		if (strCell.equals("") || strCell == null) {
//			return "";
//		}
//
//		return strCell;
//	}
//
//	/**
//	 * ��Ԫ���ʽΪCELL_TYPE_NUMERIC��
//	 * �����ֿ��ܣ�1�����ڸ�ʽ 2�����ָ�ʽ
//	 * @param cell
//	 * @return
//	 */
//	public static String getDate(Cell cell) {
//		if (cell.getCellStyle().getDataFormat() == HSSFDataFormat.getBuiltinFormat("m/d/yy")) {
//			String sDate = cell.getNumericCellValue() + "";
//			if (sDate != null && !sDate.equals("")) {
//				Date date = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());
//				return new SimpleDateFormat("yyyy-MM-dd").format(date);
//			}else{
//				return "";
//			}
//		}
//
//		return getInt(cell);
//	}
//
//	/**
//	 * ��ȡ��Ԫ��Ϊ���ָ�ʽ�ĵ�Ԫ������
//	 * @param cell
//	 * @return
//	 */
//	public static String getInt(Cell cell) {
//		String str_value = cell.getNumericCellValue() + "";
//		int dotPosition = str_value.indexOf(".");
//		String str_dot = str_value.substring(dotPosition + 1);
//		String ret_value = null;
//		if (str_dot.length() == 1 && str_dot.equals("0")) {
//			ret_value = str_value.substring(0, dotPosition);
//		} else {
//			ret_value = str_value;
//		}
//
//		return ret_value;
//	}
//
//	/**
//	 * ��ȡ��Ԫ���������Ϊ�������͵����
//	 * 
//	 * @param cell
//	 *            Excel��Ԫ��
//	 * @return String ��Ԫ���������
//	 */
//	private String getDateCellValue(HSSFCell cell) {
//		String result = "";
//		try {
//			int cellType = cell.getCellType();
//			if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {
//				Date date = cell.getDateCellValue();
//				result = (date.getYear() + 1900) + "-" + (date.getMonth() + 1) + "-" + date.getDate();
//			} else if (cellType == HSSFCell.CELL_TYPE_STRING) {
//				String date = getStringCellValue(cell);
//				result = date.replaceAll("[����]", "-").replace("��", "").trim();
//			} else if (cellType == HSSFCell.CELL_TYPE_BLANK) {
//				result = "";
//			}
//		} catch (Exception e) {
////			System.out.println("���ڸ�ʽ����ȷ!");
//			e.printStackTrace();
//		}
//		return result;
//	}
//
// }
