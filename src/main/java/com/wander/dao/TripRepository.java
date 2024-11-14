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
        trip1.setContent("최근 충칭의 홍야동과 그 주변을 방문했어요. 해질 무렵부터 홍야동에 도착해서 밤이 깊어질 때까지 머물렀는데, "
        		+ "홍야동의 밤은 정말 장관이었어요. 전통 건축양식을 유지하면서도 네온 불빛이 조화를 이루는 모습이 매우 인상적이었고, "
        		+ "마치 타임머신을 타고 과거와 현재를 넘나드는 듯한 기분이 들었답니다. 강변에 위치한 홍야동은 야경 명소로도 유명해서 "
        		+ "많은 사람들이 사진을 찍으러 방문하더라고요. 저도 이곳저곳을 돌아다니며 여러 각도에서 야경을 사진에 담았어요. "
        		+ "충칭은 야경뿐만 아니라 다양한 맛집도 많아서 여행 중 틈틈이 현지 음식을 즐길 수 있었고, 매 순간이 만족스러웠던 여행이었어요.");
        trip1.setMainPicture("chongqing.jpg");
        trip1.setPictures(new String[]{"chongqing1.jpg","chongqing2.jpg"});
        listOfTrips.add(trip1);
        
        Trip trip2 = new Trip();
        trip2.setEmail("admin1@admin.com");
        trip2.setId(generateId());
        trip2.setCountry("China");
        trip2.setRegion("Chengdu");
        trip2.setTitle("판다의 나라 청두로!!");
        trip2.setContent("최근 청두의 판다 보호구역을 방문했어요. 청두는 판다의 고향이라 불릴 만큼 판다 보호에 많은 노력을 기울이고 있는 도시입니다. "
        		+ "보호구역에 들어서자마자 푸른 대나무 숲과 함께 여유롭게 생활하는 판다들이 눈에 띄었어요. 특히 어린 판다들이 나무를 타고 놀거나 대나무를 "
        		+ "먹는 모습은 너무 귀엽고 사랑스러웠답니다. 가이드 투어를 통해 판다들의 생활 습관과 보호 활동에 대해 설명을 들을 수 있어서 더욱 뜻깊은 시간이었어요. "
        		+ "판다뿐만 아니라 청두의 전통 시장과 다양한 길거리 음식도 즐길 수 있어서 눈과 입이 모두 즐거웠던 여행이었어요. 자연과 어우러진 판다의 평화로운 일상을 "
        		+ "직접 볼 수 있었던 건 잊지 못할 경험이었습니다.");
        trip2.setMainPicture("chengdu.jpg");
        trip2.setPictures(new String[]{"chengdu1.jpg","chengdu2.jpg","chengdu3.jpg"});
        listOfTrips.add(trip2);
        
        Trip trip3 = new Trip();
        trip3.setEmail("admin2@admin.com");
        trip3.setId(generateId());
        trip3.setCountry("Korea");
        trip3.setRegion("Suwon");
        trip3.setTitle("수원스타필드 구경가기(+화성행궁)");
        trip3.setContent("최근 수원화성과 수원스타필드를 다녀왔어요. 먼저 수원화성에 도착했는데, 조선 시대의 성곽과 아름다운 건축물이 정말 인상적이었어요. "
        		+ "화성행궁에서 느낄 수 있는 옛날 분위기와 주변 경치가 너무 좋았고, 성곽을 따라 걸으면서 다양한 전통 문화를 경험할 수 있어서 더욱 흥미로웠답니다. "
        		+ "특히 화성행궁 내부의 정원과 연못이 잘 보존되어 있어서 옛날 궁궐의 아름다움을 그대로 느낄 수 있었어요. 이후에는 수원스타필드로 이동해서 다양한 쇼핑과 "
        		+ "맛집 탐방을 즐겼는데, 최신 트렌드의 매장들과 독특한 카페들이 많아서 볼거리가 가득했어요. 가족이나 친구와 함께 하루 종일 즐기기 좋은 곳이라 강력 추천합니다. "
        		+ "전통과 현대가 조화를 이루는 수원에서의 하루는 정말 뜻깊은 시간이었어요.");
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
