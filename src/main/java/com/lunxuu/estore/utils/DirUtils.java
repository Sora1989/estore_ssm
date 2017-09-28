package com.lunxuu.estore.utils;

public class DirUtils {
	public static String getDir(String name) {
		if (name != null) {
			int code = name.hashCode();
			// 0101 0011 0001 1110 1010
			
			//  "/2/3"
			return "/" + (code & 15) + "/" + (code >>> 4 & 15);
		}
		return null;
	}
}
