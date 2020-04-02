package com.example.curd.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.example.curd.model.Product;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class ExcelUtils {

	public static ByteArrayInputStream productsToExcel(List<Product> products) throws IOException {
		String[] COLUMNs = {"Id", "Name", "Brand", "MadeIn", "Price"};
		try(
				Workbook workbook = new XSSFWorkbook();
				ByteArrayOutputStream out = new ByteArrayOutputStream();
		){
			CreationHelper createHelper = workbook.getCreationHelper();
	 
			Sheet sheet = workbook.createSheet("Products");
	 
			Font headerFont = workbook.createFont();
			headerFont.setBold(true);
			headerFont.setColor(IndexedColors.BLUE.getIndex());
	 
			CellStyle headerCellStyle = workbook.createCellStyle();
			headerCellStyle.setFont(headerFont);
	 
			// Row for Header
			Row headerRow = sheet.createRow(0);
	 
			// Header
			for (int col = 0; col < COLUMNs.length; col++) {
				Cell cell = headerRow.createCell(col);
				cell.setCellValue(COLUMNs[col]);
				cell.setCellStyle(headerCellStyle);
			}
	 
			// CellStyle for Age
			CellStyle ageCellStyle = workbook.createCellStyle();
			ageCellStyle.setDataFormat(createHelper.createDataFormat().getFormat("#"));
	 
			int rowIdx = 1;
			for (Product customer : products) {
				Row row = sheet.createRow(rowIdx++);
	 
				row.createCell(0).setCellValue(customer.getId());
				row.createCell(1).setCellValue(customer.getName());
				row.createCell(2).setCellValue(customer.getBrand());
				row.createCell(3).setCellValue(customer.getMadein());
	 
				Cell ageCell = row.createCell(4);
				ageCell.setCellValue(customer.getPrice());
				ageCell.setCellStyle(ageCellStyle);
			}
	 
			workbook.write(out);
			return new ByteArrayInputStream(out.toByteArray());
		}
	}
	
	public static List<Product> parseExcelFile(InputStream is) {
		try {
    		Workbook workbook = new XSSFWorkbook(is);
     
    		Sheet sheet = workbook.getSheet("Product");
    		Iterator<Row> rows = sheet.iterator();
    		
    		List<Product> lstProducts = new ArrayList<>();
    		
    		int rowNumber = 0;
    		while (rows.hasNext()) {
    			Row currentRow = rows.next();
    			
    			// skip header
    			if(rowNumber == 0) {
    				rowNumber++;
    				continue;
    			}
    			
    			Iterator<Cell> cellsInRow = currentRow.iterator();

    			Product prdt = new Product();
    			
    			int cellIndex = 0;
    			while (cellsInRow.hasNext()) {
    				Cell currentCell = cellsInRow.next();
    				
    			if(cellIndex==0) { // ID
					prdt.setId((long) currentCell.getNumericCellValue());
    				} else if(cellIndex==1) { // Name
    					prdt.setName(currentCell.getStringCellValue());
    				} else if(cellIndex==2) { // Brand
    					prdt.setBrand(currentCell.getStringCellValue());
					} else if(cellIndex==3) { // MadeIn
						prdt.setMadein(currentCell.getStringCellValue());
    				} else if(cellIndex==4) { // Age
    					prdt.setPrice((float) currentCell.getNumericCellValue());
    				}
    				
    				cellIndex++;
    			}
    			
    			lstProducts.add(prdt);
    		}
    		
    		// Close WorkBook
    		workbook.close();
    		
    		return lstProducts;
        } catch (IOException e) {
        	throw new RuntimeException("FAIL! -> message = " + e.getMessage());
        }
	}
}