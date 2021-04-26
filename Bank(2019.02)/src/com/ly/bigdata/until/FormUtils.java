package com.ly.bigdata.until;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;



@SuppressWarnings("unused")
public class FormUtils {
	private static Map<String, String> typeMap;

	static {
		typeMap = new HashMap<String, String>();
		typeMap.put("byte", "toByte");
		typeMap.put("Byte", "toByte");
		typeMap.put("short", "toShort");
		typeMap.put("Short", "toShort");
		typeMap.put("char", "toChar");
		typeMap.put("Character", "toChar");
		typeMap.put("int", "toInt");
		typeMap.put("Integer", "toInt");
		typeMap.put("long", "toLong");
		typeMap.put("Long", "toLong");
		typeMap.put("float", "toFloat");
		typeMap.put("Float", "toFloat");
		typeMap.put("double", "toDouble");
		typeMap.put("Double", "toDouble");
		typeMap.put("boolean", "toBoolean");
		typeMap.put("Boolean", "toBoolean");
		typeMap.put("String", "toString");
		typeMap.put("Date", "toDate");
		typeMap.put("BigDecimal", "toBigDecimal");
	}

	private static byte toByte(String s) {
		byte b = 0;
		try {
			b = Byte.parseByte(s);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return b;
	}

	private static short toShort(String s) {
		short ss = 0;
		try {
			ss = Short.parseShort(s);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return ss;
	}

	private static char toChar(String s) {
		char c = ' ';
		try {
			c = s.charAt(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	private static int toInt(String s) {
		int i = 0;
		try {
			i = Integer.parseInt(s);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return i;
	}

	private static long toLong(String s) {
		long l = 0L;
		try {
			l = Long.parseLong(s);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return l;
	}

	private static float toFloat(String s) {
		float f = 0f;
		try {
			f = Float.parseFloat(s);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return f;
	}

	private static double toDouble(String s) {
		double d = 0d;
		try {
			d = Double.parseDouble(s);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return d;
	}

	private static boolean toBoolean(String s) {
		boolean b = false;
		try {
			b = Boolean.parseBoolean(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	private static String toString(String s) {
		return s;
	}

	private static BigDecimal toBigDecimal(String s) {
		BigDecimal bd = null;
		try {
			bd = new BigDecimal(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bd;
	}

	private static Date toDate(String s) {
		Date date = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			date = sdf.parse(s);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static <T> T getObject(Class<T> clazz, HttpServletRequest request) {
		T entity = null;
		try {
			entity = clazz.newInstance();
		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		// 获取实体类所有的属性  CustInfo.class
		Field[] fields = clazz.getDeclaredFields();
		// 遍历所有字段
		for (Field field : fields) {
			// 获取字段类型
			Class<?> fieldType = field.getType();
			// 获取字段类型的简单名称
			String simpType = field.getType().getSimpleName();
			// 获取字段名称
			String fieldName = field.getName();
			// 获取字段的值
			String[] values = request.getParameterValues(fieldName);

			// 判断自段是否有值
			if (values != null && values.length != 0) {
				// 判断是否是数组
				if (fieldType.isArray()) {
					// 获取数据的类型
					String typeMethodName = typeMap.get(simpType.substring(0, simpType.length() - 2));
					Object[] arrPara = null;
					if (fieldType == String[].class) {
						arrPara = new String[values.length];
					}
					if (fieldType == Integer[].class) {
						arrPara = new Integer[values.length];
					}
					if (fieldType == Float[].class) {
						arrPara = new Float[values.length];
					}
					if (fieldType == Byte[].class) {
						arrPara = new Byte[values.length];
					}
					if (fieldType == Long[].class) {
						arrPara = new Long[values.length];
					}
					if (fieldType == Character[].class) {
						arrPara = new Character[values.length];
					}
					if (fieldType == Boolean[].class) {
						arrPara = new Boolean[values.length];
					}
					// 获取FormUtils中的转换方法typeMethodName
					try {
						Method method=FormUtils.class.getDeclaredMethod(typeMethodName, String.class);
						for(int i=0;i<values.length;i++) {
							arrPara[i]=method.invoke(null, values[i]);
						}
					} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						e.printStackTrace();
					}
					// 获取对象的属性，并赋值
					field.setAccessible(true);
					try {
						field.set(entity, arrPara);
					} catch (IllegalArgumentException | IllegalAccessException e) {
						e.printStackTrace();
					}
				} else {
					for (String s : values) {
						try {
							// 获取原来类型的值
							Method method = FormUtils.class.getDeclaredMethod(typeMap.get(simpType), String.class);
							Object value = method.invoke(null, s);
							// 获取对象的属性，并赋值
							field.setAccessible(true);
							field.set(entity, value);
						} catch (NoSuchMethodException | SecurityException | IllegalAccessException
								| IllegalArgumentException | InvocationTargetException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
		return entity;
	}
}
