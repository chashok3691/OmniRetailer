package com.tlabs.posweb.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.EnumMap;
import java.util.Map;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.oned.EAN13Writer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

/**
 * @author Crunchify.com Updated: 03/20/2016 - added code to narrow border size
 */

public class BarCodeEAN13 {

	// Tutorial: http://zxing.github.io/zxing/apidocs/index.html

	public static void main(String[] args) {
		String myCodeText = "5901234123457";
		String filePath = "/Users/karthik.k/Documents/EAN13.png";
		int size = 250;
		String fileType = "png";
		File myFile = new File(filePath);
		Integer bcWidth = 0;
		bcWidth = (bcWidth == 0) ? 300 : bcWidth;
		Integer bcHeight = 0;
		bcHeight = (bcHeight == 0) ? 100 : bcHeight;
		try {

			Map<EncodeHintType, Object> hintMap = new EnumMap<EncodeHintType, Object>(
					EncodeHintType.class);
			hintMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");

			// Now with zxing version 3.2.1 you could change border size (white
			// border size to just 1)
			hintMap.put(EncodeHintType.MARGIN, 1); /* default = 4 */
			hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

			EAN13Writer ean13Writer = new EAN13Writer();
			BitMatrix byteMatrix = ean13Writer.encode(myCodeText,
					BarcodeFormat.EAN_13, bcWidth, bcHeight, hintMap);
			BufferedImage image = new BufferedImage(bcWidth, bcHeight,
					BufferedImage.TYPE_INT_RGB);
			image.createGraphics();

			Graphics2D graphics = (Graphics2D) image.getGraphics();
			graphics.setColor(Color.WHITE);
			graphics.fillRect(0, 0, bcWidth, bcHeight);
			graphics.setColor(Color.BLACK);

			for (int i = 0; i < bcWidth; i++) {
				for (int j = 0; j < bcHeight; j++) {
					if (byteMatrix.get(i, j)) {
						graphics.fillRect(i, j, 1, 1);
					}
				}
			}
			ImageIO.write(image, fileType, myFile);

		} catch (WriterException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//System.out.println("\n\nYou have successfully created EAN13 Code.");
	}
}