/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.utils;

/**
 * @version 1.0
 * @author tangqian
 */
public class ArrayUtils {
	
	/**
     * Returns a string representation of the contents of the specified array.
     * The string representation consists of a list of the array's elements.  
     * Adjacent elements are separated by the characters <tt>","</tt> (a comma
     * ).  Elements are converted to strings as by
     * <tt>String.valueOf(int)</tt>.  Returns <tt>""</tt> if <tt>a</tt> is
     * <tt>null</tt>.
     * 
     * @param a the array whose string representation to return
     * @return a string representation of <tt>a</tt>
	 */
    public static String toString(int[] a) {
        if (a == null)
            return "";
        int iMax = a.length - 1;
        if (iMax == -1)
            return "";

        StringBuilder b = new StringBuilder();
        for (int i = 0; ; i++) {
            b.append(a[i]);
            if (i == iMax)
                return b.toString();
            b.append(',');
        }
    }

    /**
     * Returns a string representation of the contents of the specified array.
     * If the array contains other arrays as elements, they are converted to
     * strings by the {@link Object#toString} method inherited from
     * <tt>Object</tt>, which describes their <i>identities</i> rather than
     * their contents.
     * Adjacent elements are separated by the characters <tt>","</tt> (a comma
     * ).  Returns <tt>""</tt> if <tt>a</tt> is
     * <tt>null</tt>.
     *
     * @param a the array whose string representation to return
     * @return a string representation of <tt>a</tt>
     */
	public static String toString(Object[] a) {
		if (a == null)
			return "";

		int iMax = a.length - 1;
		if (iMax == -1)
			return "";

		StringBuilder b = new StringBuilder();
		for (int i = 0;; i++) {
			b.append(String.valueOf(a[i]));
			if (i == iMax)
				return b.toString();
			b.append(',');
		}
	}
}
