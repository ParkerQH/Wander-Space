package com.wander.dao;

import java.util.ArrayList;
import com.wander.dto.Trip;

import dto.Book;

public class TripRepository {
    private ArrayList<Trip> listOfTrips = new ArrayList<Trip>();
    private static TripRepository instance = new TripRepository();

    public static TripRepository getInstance() {
        return instance;
    }

    //초기값
    public TripRepository() {
		Trip trip1 = new Trip();
		trip1.setEmail("admin1@admin.com");
		trip1.setId("admin1@admin.com-1");
		trip1.setCountry("China");
		trip1.setRegion("Chongqing");
		trip1.setTitle("아름다운 충칭의 야경을 사진에 담다.");
		trip1.setContent("최근 sns에서 화제가 되고 있는 홍야동에 다녀왔습니다."
				+ "야경이 정말 이쁜 장소였던 것 같아요. 중국 충칭여행을 알아보고 있으시다면 꼭 가보는 걸 추천드립니다!!");
		trip1.setMainPicture("chongqing.jpg");
		trip1.setPictures(new String[]{});
		
		Trip trip2 = new Trip();
		trip2.setEmail("admin1@admin.com");
		trip2.setId("admin1@admin.com-2");
		trip2.setCountry("Korea");
		trip2.setRegion("Busan");
		trip2.setTitle("아름다운 충칭의 야경을 사진에 담다.");
		trip2.setContent("최근 sns에서 화제가 되고 있는 홍야동에 다녀왔습니다."
				+ "야경이 정말 이쁜 장소였던 것 같아요. 중국 충칭여행을 알아보고 있으시다면 꼭 가보는 걸 추천드립니다!!");
		trip2.setMainPicture("chongqing.jpg");
		trip2.setPictures(new String[]{});
		
		Trip trip3 = new Trip();
		trip3.setEmail("admin2@admin.com");
		trip3.setId("admin2@admin.com-1");
		trip3.setCountry("China");
		trip3.setRegion("Chongqing");
		trip3.setTitle("아름다운 충칭의 야경을 사진에 담다.");
		trip3.setContent("최근 sns에서 화제가 되고 있는 홍야동에 다녀왔습니다."
				+ "야경이 정말 이쁜 장소였던 것 같아요. 중국 충칭여행을 알아보고 있으시다면 꼭 가보는 걸 추천드립니다!!");
		trip3.setMainPicture("chongqing.jpg");
		trip3.setPictures(new String[]{});
		
		listOfTrips.add(trip1);
		listOfTrips.add(trip2);
		listOfTrips.add(trip3);
	}
    
    public ArrayList<Trip> getAllTrips() {
        return listOfTrips;
    }
    
    // ID 자동 생성 메서드
    private String generateId(String email) {
        int n = 1;
        String id = email + "-" + n;

        // 중복된 ID가 존재하는 경우 숫자를 증가시키며 새 ID를 생성
        while (isIdExists(id)) {
            n++;
            id = email + "-" + n;
        }
        return id;
    }

    // 특정 ID가 존재하는지 확인하는 메서드
    private boolean isIdExists(String id) {
        for (Trip trip : listOfTrips) {
            if (trip.getId().equals(id)) {
                return true;
            }
        }
        return false;
    }

    // 트립 추가 메서드
    public void addTrip(Trip trip) {
        // 새 ID를 생성하여 트립에 설정
        String id = generateId(trip.getEmail());
        trip.setId(id);

        // 리스트에 트립 추가
        listOfTrips.add(trip);
    }
}
