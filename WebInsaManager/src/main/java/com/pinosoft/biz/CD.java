package com.pinosoft.biz;

import java.util.Calendar;

public class CD {

	// 이름, 주소, 전화번호 자동 생성기
	static String k1[] = { "010", "011", "016", "017", "018", "019", "02", "031", "032", "041", "051", "053", "063",
			"062", "044" };
	static String k2[] = { "1111", "2222", "3333", "4444", "5555", "6666", "7777", "8888", "9999", "1234", "4321",
			"0000", "5678", "9876", "1000", "2000", "3000", "4000", "5000", "6000", "7000", "8000", "9000", "1122",
			"3344", "4455", "5566", "7788", "9900" };

	static String k3[] = { "가", "교", "고", "공", "강", "남", "담", "동", "두", "라", "란", "마", "래", "권", "방", "백", "보", "배",
			"반", "수", "송", "새", "안", "룡", "용", "오", "우", "욱", "을", "장", "재", "조", "종", "주", "중", "지", "창", "찬", "추",
			"충", "해", "한", "호", "후", "영", "진", "현", "형", "로", "완", "환", "권", "흥", "철", "범", "봄", "복", "기", "길", "건",
			"곤", "문", "술", "성" };

	static String k4[] = { "대로", "역로", "도로", "길", "동" };
	static String firstname[] = { "김", "이", "박", "서", "최", "지", "황", "전", "장", "강", "주", "추", "고", "기", "나", "노", "도",
			"라", "우", "조", "하", "권", "백", "방", "배", "안", "현" };

	static String add1[] = { "서울시", "경기", "인천광역시", "전주", "충북", "충남", "전남", "전북", "경남", "경북", "대구광역시", "대전광역시", "부산광역시",
			"강원", "울산광역시", "세종시", "제주시" };

	public static void main(String[] args) {
		String pos[] = {"사원","부사원"};
		System.out.println(pos[1]);
	}
	
	// 이름 생성
	public static String getName() {
		String str = firstname[(int) (Math.random() * firstname.length)];
		str += k3[(int) (Math.random() * firstname.length)];
		str += k3[(int) (Math.random() * firstname.length)];

		return str;
	}

	
		
	// 주소 생성
	public static String getAddress(int flag) {
		String addr1 = add1[(int) (Math.random() * add1.length)];
		String addr2 = "";
		
		if (addr1.length() < 3)
			addr1 += " " + k3[(int) (Math.random() * k3.length)] + k3[(int) (Math.random() * k3.length)] + "시 ";
		else
			addr1 += " ";
				
		addr1 += k3[(int) (Math.random() * k3.length)] + k3[(int) (Math.random() * k3.length)] + "구 ";
		addr1 += k3[(int) (Math.random() * k3.length)] + k3[(int) (Math.random() * k3.length)]
				+ k4[(int) (Math.random() * k4.length)] + " ";
		addr2 += (int) (Math.random() * 100 + 1) + "-" + (int) (Math.random() * 100 + 1);
		
		if(flag == 1) {
			return addr1;
		} else if(flag == 2) {
			return addr2;
		} 
		
		return addr1 + addr2;
	}

	// 전화번호 생성
	public static String getPhone() {
		String str = k1[(int) (Math.random() * k1.length)];
		str += "-" + k2[(int) (Math.random() * k2.length)];
		str += "-" + k2[(int) (Math.random() * k2.length)];
		return str;
	}

	// 우편번호
	public static String getPost() {
		return "" + (int) (Math.random() * 899999) + 100000;
	}
	
	
	// 주민등록번호 전체 생성
	public static String getRegNo() {
		return getRegNo(0);
	}
	
	// 주민등록번호 생성기
	public static String getRegNo(int no) {
		String birthDay = getDate();
		String regNo1 = birthDay.substring(2, 8);
		String regNo2 = "";
		boolean isLocal = (int) (Math.random() * 100)  < 95 ? true : false;
		boolean isFemail = (int) (Math.random() * 2)  == 1 ? true : false;
		
		if(Integer.parseInt(birthDay.substring(0,2)) >= 20) {	// 2000년대 이후
			if(isLocal) {	// 내국인
 				if(isFemail) regNo2 += "4"; 
 				else regNo2 += "3";
 			} else {		// 외국인
 				if(isFemail) regNo2 += "8"; 
 				else regNo2 += "7";
 			}
 		} else if(Integer.parseInt(birthDay.substring(0,2)) >= 19) {	// 1900년대 이후
 			if(isLocal) {	// 내국인
 				if(isFemail) regNo2 += "2"; 
 				else regNo2 += "1";
 			} else {		// 외국인
 				if(isFemail) regNo2 += "6"; 
 				else regNo2 += "5";
 			}
 		}
		
		regNo2 += "" + ((int)(Math.random() * 899999) + 100001);
		
		if(no == 1) {	// 앞지리
			return regNo1;
		} else if(no == 2) {	// 성별
			return regNo2.substring(0,1);
		} else if(no == 3) { 	// 뒷자리
			return regNo2;
		}
		return regNo1 + "-" + regNo2;
	}
	
	// 날짜 생성
	public static String getDate() {
		return getDate(1980);
	}

	public static String getDate(int startYear) {
		int thisYear = Calendar.getInstance().get(Calendar.YEAR);
		int thisMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
		int thisDate = Calendar.getInstance().get(Calendar.DATE);
		
		int year = (int) (Math.random() * (thisYear - startYear) + startYear + 1);
		int month = (int) (Math.random() * 12) + 1;
		int date;
		String str = "";

		// 월
		switch (month) {
		case 2:
			date = (int) (Math.random() * 28) + 1;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			date = (int) (Math.random() * 30) + 1;
			break;
		default:
			date = (int) (Math.random() * 31) + 1;
			break;
		}

		// 년월일 체크
		if (year == thisYear && month > thisMonth) {
			month = thisMonth;
		}

		if (year == thisYear && month == thisMonth && date > thisDate) {
			date = thisDate;
		}

		if (month < 10)
			str += year + "0" + month;
		else
			str += year + "" + month;

		if (date < 10)
			str += "0" + date;
		else
			str += "" + date;

		return str;
	}
	
	
	// 랜덤한 숫자 범위 start ~ end 까지 
	public static int getRandom(int start, int end) {
		return (int) (Math.random() * (end-start +1)) + start;
	}
}

