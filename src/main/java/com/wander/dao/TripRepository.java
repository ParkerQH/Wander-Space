package com.wander.dao;

import java.util.ArrayList;
import com.wander.dto.Trip;

public class TripRepository {
    private ArrayList<Trip> listOfTrips = new ArrayList<Trip>();
    private static TripRepository instance = new TripRepository();

    public static TripRepository getInstance() {
        return instance;
    }

    // 초기값
    public TripRepository() {
        Trip trip1 = new Trip();
        trip1.setEmail("admin1@admin.com");
        trip1.setId(generateId());
        trip1.setCountry("China");
        trip1.setRegion("Chongqing");
        trip1.setTitle("아름다운 충칭의 야경을 사진에 담다.");
        trip1.setContent("최근 충칭의 홍야동과 그 주변을 방문했어요...");
        trip1.setMainPicture("chongqing.jpg");
        trip1.setPictures(new String[]{"chongqing1.jpg","chongqing2.jpg"});
        listOfTrips.add(trip1);
        
        Trip trip2 = new Trip();
        trip2.setEmail("admin1@admin.com");
        trip2.setId(generateId());
        trip2.setCountry("China");
        trip2.setRegion("Chengdu");
        trip2.setTitle("판다의 나라 청두로!!");
        trip2.setContent("최근 청두의 판다 보호구역을 방문했어요...");
        trip2.setMainPicture("chengdu.jpg");
        trip2.setPictures(new String[]{"chengdu1.jpg","chengdu2.jpg","chengdu3.jpg"});
        listOfTrips.add(trip2);
        
        Trip trip3 = new Trip();
        trip3.setEmail("admin2@admin.com");
        trip3.setId(generateId());
        trip3.setCountry("Korea");
        trip3.setRegion("Suwon");
        trip3.setTitle("수원스타필드 구경가기(+화성행궁)");
        trip3.setContent("최근 수원화성과 수원스타필드를 다녀왔어요...");
        trip3.setMainPicture("suwon.jpg");
        trip3.setPictures(new String[]{"suwon1.jpg","suwon2.jpg","suwon3.jpg","suwon4.jpg"});
        listOfTrips.add(trip3);
    }

    public ArrayList<Trip> getAllTrips() {
        return listOfTrips;
    }

    // ID 자동 생성 메서드
    private String generateId() {
    	return "id" + (listOfTrips.size() + 1);
    }

    // 트립 추가 메서드
    public void addTrip(Trip trip) {
        String id = generateId();
        trip.setId(id);
        System.out.println("Set ID in Trip object: " + trip.getId());  // 설정된 ID 확인

        listOfTrips.add(trip);
    }

    public Trip getTripById(String tripId) {
        for (Trip trip : listOfTrips) {
            if (trip.getId().trim().equalsIgnoreCase(tripId.trim())) {
                return trip;
            }
        }
        return null;
    }
}
