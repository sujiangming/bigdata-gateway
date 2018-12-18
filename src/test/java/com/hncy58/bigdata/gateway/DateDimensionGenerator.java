package com.hncy58.bigdata.gateway;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateDimensionGenerator {
	
	public static void main(String[] args) throws Exception {
		
		Calendar start = Calendar.getInstance();
		Calendar end = Calendar.getInstance();
		
		// 开始年份
		int startYear = start.get(Calendar.YEAR);
		// 生成多少年数据
		int numYears = 5;
		
		if(args.length >= 2) {
			startYear = Integer.parseInt(args[0]);
			numYears = Integer.parseInt(args[1]);
		}
		
		start.set(Calendar.YEAR, startYear);
		start.set(Calendar.MONTH, 0);
		start.set(Calendar.DAY_OF_MONTH, 1);
		start.set(Calendar.HOUR, 0);
		start.set(Calendar.MINUTE, 0);
		start.set(Calendar.SECOND, 0);

		end.set(Calendar.MONTH, 0);
		end.set(Calendar.DAY_OF_MONTH, 1);
		end.set(Calendar.HOUR, 0);
		end.set(Calendar.MINUTE, 0);
		end.set(Calendar.SECOND, 0);
		
		end.set(Calendar.YEAR, start.get(Calendar.YEAR) + numYears);
		
		String datas = generateData(start, end);
		
//		System.out.println(datas);
		
		File outFile = new File("dim_date_day.txt");
		
		if(outFile.exists()) {
			outFile.delete();
		}
		
		BufferedWriter bw = null;

		try {
			bw = new BufferedWriter(new FileWriter(outFile));
			bw.write(datas);
			bw.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(bw != null) {
				bw.close();
			}
		}
		
		System.out.println("finished");
		
		test();
	}
	
	public static String generateData(Calendar start, Calendar end) {
		
		StringBuffer buf = new StringBuffer();
		
		while(start.before(end)) {
			
			String data = generateData(start);
			buf.append(data).append("\n");
			// 增加一天
			start.set(Calendar.DAY_OF_MONTH, start.get(Calendar.DAY_OF_MONTH) + 1);
		}
		
		// 删除末尾换行符
		if(buf.length() > 0) {
			buf.deleteCharAt(buf.length() - 1);
		}
		
		return buf.toString();
	}
	private static String generateData(Calendar c) {
		
		StringBuffer buf = new StringBuffer();
		
		buf.append(getDayDateId(c) + ",");
		buf.append(getDayDateName(c) + ",");
		buf.append(getDayStartDate(c) + ",");
		buf.append(getDayEndDate(c) + ",");
		buf.append(c.get(Calendar.DAY_OF_MONTH) + ",");
		buf.append(c.get(Calendar.DAY_OF_YEAR) + ",");

		buf.append(getWeekID(c) + ",");
		buf.append(getWeekName(c) + ",");
		buf.append(getWeekDayStartDate(c) + ",");
		buf.append(getWeekDayEndDate(c) + ",");
		buf.append((c.get(Calendar.DAY_OF_WEEK) - 1) + ",");
		buf.append((c.get(Calendar.WEEK_OF_MONTH)) + ",");
		buf.append((c.get(Calendar.WEEK_OF_YEAR) + 1) + ",");
		buf.append((c.get(Calendar.DAY_OF_WEEK_IN_MONTH)) + ",");

		buf.append(getMonthID(c) + ",");
		buf.append(getMonthName(c) + ",");
		buf.append(getMonthStart(c) + ",");
		buf.append(getMonthEnd(c) + ",");
		buf.append((c.get(Calendar.MONTH) + 1) + ",");

		buf.append(getQuarterID(c) + ",");
		buf.append(getQuarterName(c) + ",");
		buf.append(getQuarterStart(c) + ",");
		buf.append(getQuarterEnd(c) + ",");
		buf.append(getQuarterOfYear(c) + ",");

		buf.append(getHalfYearID(c) + ",");
		buf.append(getHalfYearName(c) + ",");
		buf.append(getHalfYearStart(c) + ",");
		buf.append(getHalfYearEnd(c) + ",");
		buf.append(getHalfYearOfYear(c) + ",");

		buf.append(c.get(Calendar.YEAR) + ",");
		buf.append(c.get(Calendar.YEAR) + "年,");
		buf.append(getYearStart(c) + ",");
		buf.append(getYearEnd(c));
		
		return buf.toString();
	}
	
	public static void test() {
		Calendar c = Calendar.getInstance();

		System.out.println("DATE_ID：" + getDayDateId(c));
		System.out.println("DATE_NAME：" + getDayDateName(c));
		System.out.println("DATE_START：" + getDayStartDate(c));
		System.out.println("DATE_END：" + getDayEndDate(c));
		System.out.println("DAY_OF_MONTH：" + c.get(Calendar.DAY_OF_MONTH));
		System.out.println("DAY_OF_YEAR：" + c.get(Calendar.DAY_OF_YEAR));

		System.out.println("WEEK_ID：" + getWeekID(c));
		System.out.println("WEEK_NAME：" + getWeekName(c));
		System.out.println("WEEK_START：" + getWeekDayStartDate(c));
		System.out.println("WEEK_END：" + getWeekDayEndDate(c));
		System.out.println("DAY_OF_WEEK：" + (c.get(Calendar.DAY_OF_WEEK) - 1));
		System.out.println("WEEK_OF_MONTH：" + (c.get(Calendar.WEEK_OF_MONTH)));
		System.out.println("WEEK_OF_YEAR：" + (c.get(Calendar.WEEK_OF_YEAR) + 1));
		System.out.println("DAY_OF_WEEK_IN_MONTH：" + (c.get(Calendar.DAY_OF_WEEK_IN_MONTH)));

		System.out.println("MONTH_ID：" + getMonthID(c));
		System.out.println("MONTH_NAME：" + getMonthName(c));
		System.out.println("MONTH_START：" + getMonthStart(c));
		System.out.println("MONTH_END：" + getMonthEnd(c));
		System.out.println("MONTH_OF_YEAR：" + (c.get(Calendar.MONTH) + 1));

		System.out.println("QUARTER_ID：" + getQuarterID(c));
		System.out.println("QUARTER_NAME：" + getQuarterName(c));
		System.out.println("QUARTER_START：" + getQuarterStart(c));
		System.out.println("QUARTER_END：" + getQuarterEnd(c));
		System.out.println("QUARTER_OF_YEAR：" + getQuarterOfYear(c));

		System.out.println("HALF_YEAR_ID：" + getHalfYearID(c));
		System.out.println("HALF_YEAR_NAME：" + getHalfYearName(c));
		System.out.println("HALF_YEAR_START：" + getHalfYearStart(c));
		System.out.println("HALF_YEAR_END：" + getHalfYearEnd(c));
		System.out.println("HALF_YEAR_OF_YEAR：" + getHalfYearOfYear(c));

		System.out.println("YEAR_ID：" + c.get(Calendar.YEAR));
		System.out.println("YEAR_NAME：" + c.get(Calendar.YEAR) + "年");
		System.out.println("YEAR_START：" + getYearStart(c));
		System.out.println("YEAR_END：" + getYearEnd(c));
	}

	private final static SimpleDateFormat shortLongSdf = new SimpleDateFormat("yyyyMMdd");
	private final static SimpleDateFormat shortStrSdf = new SimpleDateFormat("yyyy年MM月dd日");
	private final static SimpleDateFormat longDateSdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public static long getWeekID(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		c.set(Calendar.DAY_OF_MONTH, c.get(Calendar.DAY_OF_MONTH) - 1);
		int weekday = c.get(Calendar.WEEK_OF_YEAR);
		int month = c.get(Calendar.MONTH);
		String weekId = "";
		
		if(month == 11 && weekday == 1) {
			Calendar lastWeekC = (Calendar) c.clone();
			lastWeekC.set(Calendar.DAY_OF_MONTH, c.get(Calendar.DAY_OF_MONTH) - 7);
			weekId = (c.get(Calendar.YEAR) + 1) + "0" + weekday;
		} else {
			if(weekday < 10) {
				weekId = c.get(Calendar.YEAR) + "00" + weekday;
			} else {
				weekId = c.get(Calendar.YEAR) + "0" + weekday;
			}
		}
		
		return Integer.valueOf(weekId);
	}
	
	public static String getWeekName(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		c.set(Calendar.DAY_OF_MONTH, c.get(Calendar.DAY_OF_MONTH) - 1);
		int weekday = c.get(Calendar.WEEK_OF_YEAR);
		int month = c.get(Calendar.MONTH);
		String weekId = "";
		
		if(month == 11 && weekday == 1) {
			Calendar lastWeekC = (Calendar) c.clone();
			lastWeekC.set(Calendar.DAY_OF_MONTH, c.get(Calendar.DAY_OF_MONTH) - 7);
			weekId = (c.get(Calendar.YEAR) + 1) + "年0" + weekday + "周";
		} else {
			if(weekday < 10) {
				weekId = c.get(Calendar.YEAR) + "年0" + weekday + "周";
			} else {
				weekId = c.get(Calendar.YEAR) + "年" + weekday + "周";
			}
		}
		
		return weekId;
	}

	public static String getWeekDayStartDate(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		c.set(Calendar.DAY_OF_MONTH, c.get(Calendar.DAY_OF_MONTH) - 1);
		int weekday = c.get(Calendar.DAY_OF_WEEK) - 2;
		c.add(Calendar.DATE, -weekday);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return longDateSdf.format(c.getTime());
	}

	public static String getWeekDayEndDate(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		c.set(Calendar.DAY_OF_MONTH, c.get(Calendar.DAY_OF_MONTH) - 1);
		
		int weekday = c.get(Calendar.DAY_OF_WEEK);
		c.add(Calendar.DATE, 8 - weekday);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		return (longDateSdf.format(c.getTime()));
	}

	public static long getDayDateId(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		return Long.parseLong(shortLongSdf.format(c.getTime()));
	}

	public static String getDayDateName(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		return shortStrSdf.format(c.getTime());
	}

	public static String getDayStartDate(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return longDateSdf.format(c.getTime());
	}

	public static String getDayEndDate(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		return longDateSdf.format(c.getTime());
	}

	public static long getMonthID(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		int monthId = c.get(Calendar.MONTH) + 1;
		String monthName = "";
		
		if(monthId < 10) {
			monthName = c.get(Calendar.YEAR) + "0" + monthId;
		} else {
			monthName = c.get(Calendar.YEAR) + "" + monthId;
		}
		
		return Long.parseLong(monthName);
	}
	
	public static String getMonthName(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		int monthId = c.get(Calendar.MONTH) + 1;
		
		if(monthId < 10) {
			return c.get(Calendar.YEAR) + "年0" + monthId + "月";
		} else {
			return c.get(Calendar.YEAR) + "年" + monthId + "月";
		}
	}

	public static String getMonthStart(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		c.set(Calendar.DATE, 1);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return longDateSdf.format(c.getTime());
	}

	public static String getMonthEnd(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		c.set(Calendar.DATE, 1);
		c.add(Calendar.MONTH, 1);
		c.add(Calendar.DATE, -1);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		return longDateSdf.format(c.getTime());
	}

	public static String getYearStart(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		c.set(Calendar.MONTH, 0);
		c.set(Calendar.DATE, 1);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return longDateSdf.format(c.getTime());
	}

	public static String getYearEnd(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		c.set(Calendar.MONTH, 11);
		c.set(Calendar.DATE, 31);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		return longDateSdf.format(c.getTime());
	}

	public static long getQuarterID(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();

		int currentMonth = c.get(Calendar.MONTH) + 1;
		String quarter = "0";

		if (currentMonth >= 1 && currentMonth <= 3)
			quarter = "1";
		else if (currentMonth >= 4 && currentMonth <= 6)
			quarter = "2";
		else if (currentMonth >= 7 && currentMonth <= 9)
			quarter = "3";
		else if (currentMonth >= 10 && currentMonth <= 12)
			quarter = "4";

		return Long.parseLong(c.get(Calendar.YEAR) + quarter);
	}
	
	public static String getQuarterName(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		int currentMonth = c.get(Calendar.MONTH) + 1;
		String quarter = "0";
		
		if (currentMonth >= 1 && currentMonth <= 3)
			quarter = "1";
		else if (currentMonth >= 4 && currentMonth <= 6)
			quarter = "2";
		else if (currentMonth >= 7 && currentMonth <= 9)
			quarter = "3";
		else if (currentMonth >= 10 && currentMonth <= 12)
			quarter = "4";
		
		return c.get(Calendar.YEAR) + "年" + quarter + "季";
	}
	
	public static long getQuarterOfYear(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		int currentMonth = c.get(Calendar.MONTH) + 1;
		int quarter = 0;
		
		if (currentMonth >= 1 && currentMonth <= 3)
			quarter = 1;
		else if (currentMonth >= 4 && currentMonth <= 6)
			quarter = 2;
		else if (currentMonth >= 7 && currentMonth <= 9)
			quarter = 3;
		else if (currentMonth >= 10 && currentMonth <= 12)
			quarter = 4;
		
		return quarter;
	}

	public static String getQuarterStart(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		int currentMonth = c.get(Calendar.MONTH) + 1;
		if (currentMonth >= 1 && currentMonth <= 3)
			c.set(Calendar.MONTH, 0);
		else if (currentMonth >= 4 && currentMonth <= 6)
			c.set(Calendar.MONTH, 3);
		else if (currentMonth >= 7 && currentMonth <= 9)
			c.set(Calendar.MONTH, 4);
		else if (currentMonth >= 10 && currentMonth <= 12)
			c.set(Calendar.MONTH, 9);

		c.set(Calendar.DATE, 1);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return longDateSdf.format(c.getTime());
	}

	public static String getQuarterEnd(Calendar c1) {
		
		Calendar c = Calendar.getInstance();
		c.setTime(c1.getTime());
		
		int currentMonth = c.get(Calendar.MONTH) + 1;
		if (currentMonth >= 1 && currentMonth <= 3) {
			c.set(Calendar.MONTH, 2);
			c.set(Calendar.DATE, 31);
		} else if (currentMonth >= 4 && currentMonth <= 6) {
			c.set(Calendar.MONTH, 5);
			c.set(Calendar.DATE, 30);
		} else if (currentMonth >= 7 && currentMonth <= 9) {
			c.set(Calendar.MONTH, 8);
			c.set(Calendar.DATE, 30);
		} else if (currentMonth >= 10 && currentMonth <= 12) {
			c.set(Calendar.MONTH, 11);
			c.set(Calendar.DATE, 31);
		}
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		return longDateSdf.format(c.getTime());
	}

	public static String getHalfYearID(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		int currentMonth = c.get(Calendar.MONTH) + 1;
		String halfYear = "H0";
		if (currentMonth >= 1 && currentMonth <= 6) {
			halfYear = "H1";
		} else if (currentMonth >= 7 && currentMonth <= 12) {
			halfYear = "H2";
		}

		return c.get(Calendar.YEAR) + halfYear;
	}
	
	public static String getHalfYearName(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		int currentMonth = c.get(Calendar.MONTH) + 1;
		String halfYear = "";
		if (currentMonth >= 1 && currentMonth <= 6) {
			halfYear = "上半年";
		} else if (currentMonth >= 7 && currentMonth <= 12) {
			halfYear = "下半年";
		}
		
		return c.get(Calendar.YEAR) + halfYear;
	}
	
	public static int getHalfYearOfYear(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		int currentMonth = c.get(Calendar.MONTH) + 1;
		int halfYear = 0;
		if (currentMonth >= 1 && currentMonth <= 6) {
			halfYear = 1;
		} else if (currentMonth >= 7 && currentMonth <= 12) {
			halfYear = 2;
		}
		
		return halfYear;
	}

	public static String getHalfYearStart(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		int currentMonth = c.get(Calendar.MONTH) + 1;
		if (currentMonth >= 1 && currentMonth <= 6) {
			c.set(Calendar.MONTH, 0);
		} else if (currentMonth >= 7 && currentMonth <= 12) {
			c.set(Calendar.MONTH, 6);
		}

		c.set(Calendar.DATE, 1);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);

		return longDateSdf.format(c.getTime());
	}

	public static String getHalfYearEnd(Calendar c1) {
		
		Calendar c = (Calendar) c1.clone();
		
		int currentMonth = c.get(Calendar.MONTH) + 1;
		if (currentMonth >= 1 && currentMonth <= 6) {
			c.set(Calendar.MONTH, 5);
			c.set(Calendar.DATE, 30);
		} else if (currentMonth >= 7 && currentMonth <= 12) {
			c.set(Calendar.MONTH, 11);
			c.set(Calendar.DATE, 31);
		}

		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);

		return longDateSdf.format(c.getTime());
	}

}
