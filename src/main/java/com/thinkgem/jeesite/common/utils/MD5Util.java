package com.thinkgem.jeesite.common.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @SystemName 运行优化
 * @ModuleName
 * @ClassName MD5Util
 * @author TJH
 * @Date 2013-7-4 下午5:55:19
 * @version V1.0
 * @Description MD5加密
 */
public class MD5Util {

	private MD5Util() {
	}

	/**
	 * @Title getDigest
	 * @author TJH
	 * @Date 2013-7-4 下午5:55:41
	 * @Description
	 * @return MessageDigest
	 */
	static MessageDigest getDigest() {
		try {
			return MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * @Title md5
	 * @author TJH
	 * @Date 2013-7-4 下午5:56:08
	 * @Description 计算MD5摘要和返回值为16个元素
	 * @param data
	 * @return byte[]
	 */
	public static byte[] md5(byte[] data) {
		return getDigest().digest(data);
	}

	/**
	 * @Title md5
	 * @author TJH
	 * @Date 2013-7-4 下午5:56:38
	 * @Description 计算MD5摘要和返回值为16个元素
	 * @param data
	 * @return byte[]
	 */
	public static byte[] md5(String data) {
		return md5(data.getBytes());
	}

	/**
	 * @Title md5Hex
	 * @author TJH
	 * @Date 2013-7-4 下午5:57:05
	 * @Description 计算MD5摘要和返回值为32字符十六进制
	 * @param data
	 * @return String
	 */
	public static String md5Hex(byte[] data) {
		return HexUtil.toHexString(md5(data));
	}

	/**
	 * @Title md5Hex
	 * @author TJH
	 * @Date 2013-7-4 下午5:57:28
	 * @Description 计算MD5摘要和返回值为32字符十六进制
	 * @param data
	 * @return String
	 */
	public static String md5Hex(String data) {
		return HexUtil.toHexString(md5(data));
	}

	/*private static void main(String[] args) {
		// System.out.println(MD5Util.md5Hex("admin"));
		// System.out.println(MD5Util.md5Hex("123"));
		//
		// System.out.println(MD5Util.md5("admin"));
		// System.out.println(MD5Util.md5("123"));
	}*/
}
