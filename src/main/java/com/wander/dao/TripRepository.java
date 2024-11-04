package com.wander.dao;

import java.util.ArrayList;
import com.wander.dto.Trip;

public class TripRepository {
    private ArrayList<Trip> listOfTrips = new ArrayList<Trip>();
    private static TripRepository instance = new TripRepository();

    public static TripRepository getInstance() {
        return instance;
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

    // 추가적인 메서드 작성 가능
}
