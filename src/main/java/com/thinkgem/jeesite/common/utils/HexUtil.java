package com.thinkgem.jeesite.common.utils;

/**
 * @SystemName 运行优化
 * @ModuleName
 * @ClassName HexUtil
 * @author TJH
 * @Date 2013-7-4 下午5:47:30
 * @version V1.0
 * @Description 十六进制字符串与字节的转换
 */

public class HexUtil {
	/**
	 * 
	 */
	private static final String HEX_CHARS = "0123456789abcdef";

	private HexUtil() {
	}

	/**
	 * @Title toHexString
	 * @author TJH
	 * @Date 2013-7-4 下午5:48:44
	 * @Description 将一个字节数组来十六进制字符串
	 * @param b
	 * @return String
	 */
	public static String toHexString(byte[] b) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			sb.append(HexUtil.HEX_CHARS.charAt(b[i] >>> 4 & 0x0F));
			sb.append(HexUtil.HEX_CHARS.charAt(b[i] & 0x0F));
		}
		return sb.toString();
	}

	/**
	 * @Title toByteArray
	 * @author TJH
	 * @Date 2013-7-4 下午5:48:13
	 * @Description 一个十六进制字符串转换成字节数组
	 * @param s
	 * @return byte[]
	 */
	public static byte[] toByteArray(String s) {
		byte[] buf = new byte[s.length() / 2];
		int j = 0;
		for (int i = 0; i < buf.length; i++) {
			buf[i] = (byte) ((Character.digit(s.charAt(j++), 16) << 4) | Character
					.digit(s.charAt(j++), 16));
		}
		return buf;
	}
}
