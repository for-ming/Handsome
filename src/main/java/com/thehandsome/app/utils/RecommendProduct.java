package com.thehandsome.app.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class RecommendProduct {

	// 1. 정규화 : 한 유저의 행동 데이터에 대한 최대값으로 값을 나누어 저장
	public double Normalization(int data, double maxData) {

		if (data < maxData)
			return Double.parseDouble(String.format("%.2f", data / maxData));
		else
			return 1.00;
	}

	// 2. 행위 비율 계산 : 해당 값 / (해당값 + 그 옆값 + 그그 옆값...)
	public double Percentage(double central_data, double row_data1, double row_data2) {
		return Double.parseDouble(String.format("%.2f", central_data / (central_data + row_data1 + row_data2)));
	}

	// 3. 가중치 : 행위 비율에 따른 가중치 계산 (한 행위에 대한 것이므로 한 컬럼을 다 더하고 갯수로 나눔 (평균))
	public double Weight(double data, int total) {
		return Double.parseDouble(String.format("%.2f", data / total));
	}

	// 4. 선호도 계산 : 가중치와 본 데이터의 곱 연산을 합 연산한 값을 선호도로 설정
	public double Preference(int rating, double Wrating, int click_num, double Wclick_num, int stay_time,
			double Wstay_time, int is_like, double Wis_like) {
		return Double.parseDouble(String.format("%.2f", ((rating * Wrating) + (Math.log10(click_num) * Wclick_num)
				+ (Math.log10(stay_time) * Wstay_time) + (is_like * Wis_like))));
	}

	public List<String> byRuntime(String[] command) throws IOException, InterruptedException {
		List<String> list = new ArrayList<>();
		Runtime runtime = Runtime.getRuntime();
		Process process = runtime.exec(command);

		process.waitFor();
		try (InputStream psout = process.getInputStream()) {
			list = copy(psout, System.out);
		}

		return list;
	}

	public List<String> copy(InputStream input, OutputStream output) throws IOException {
		List<String> list = new ArrayList<>();
		byte[] buffer = new byte[1024];
		int n = 0;

		while ((n = input.read(buffer)) != -1) {
			output.write(buffer, 0, n);
		}

		String tmp = new String(buffer, "MS949");
		
		tmp = tmp.replace("[", "");
		tmp = tmp.replace("]", "");
		tmp = tmp.replace("'", "");
		// 마지막 문자 
		tmp = tmp.replace("\r\n", "");
		tmp = tmp.replace("\0", "");
		
		list = Arrays.asList(tmp.split(", "));

		return list;
	}

	// 5. 선호도 기반 상품 추천
	public List<String> recommend(String last_product_id) throws Exception {
		List<String> list = new ArrayList<>();
		String[] command = new String[] { "py", "C:/CFSVD/cf_SVD2.py", last_product_id };

		RecommendProduct runner = new RecommendProduct();
		list = runner.byRuntime(command);

		return list;
	}

}
