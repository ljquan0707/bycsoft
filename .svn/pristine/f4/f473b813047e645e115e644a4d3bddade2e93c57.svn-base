package com.spring.utill;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import sun.misc.BASE64Decoder;

public class generateImage {
	public static boolean generateImage(String imgStr, String path) {
		if (imgStr == null)
		return false;
	BASE64Decoder decoder = new BASE64Decoder();
		
		
		byte[] b;
		try {
			b = decoder.decodeBuffer(imgStr);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {
					b[i] += 256;
					}
				}
			System.out.println(b);
			OutputStream out = new FileOutputStream(path);
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;

		
		}

}
