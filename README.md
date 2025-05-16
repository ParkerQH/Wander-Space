# 🛫 Wander Space
지능웹설계 프로젝트, **여행 후기를 작성하고 공유할 수 있으며 여행지의 실기간 날씨도 제공 받을 수 있는 다국어 지원 웹페이지** 입니다.

## 📑 프로젝트 소개
이 웹페이지는 **전 세계적으로 여행객들에게 인기가 많은 29개국에 대한 여행 후기**를 작성하고 공유할 수 있는 플랫폼입니다.
사용자는 자신이 작성한 후기를 포함하여 언제든지 수정하거나 삭제할 수 있습니다.
웹페이지는 사용자의 작성된 후기를 제외한 모든 UI와 기능에서 **한국어, 영어, 중국어, 일본어를 지원**하여 다양한 언어 사용자에게 최적화된 경험을 제공합니다.
모든 나라와 여행 후기 페이지에서는 해당 지역에 따라 **OpenWeather API**를 통한 실시간 날씨 정보를 제공합니다.
또한, **Tomcat 서버**와 **DB**를 연동하여 안정적이고 신뢰할 수 있는 데이터 관리가 가능합니다.

## 💻개발기간
2024/10/28 ~ 2024/11/22

## 🔍실행방법
1. Eclipse IDE에서 **Dynamic Web project** 생성
2. **Tomcat v10.1** 설치 및 연결
3. MySQL에서 WanderSapceDB와 같이 **DATABASE를 생성**합니다.
4. **dbconn.jsp** 부분의 MySQL ID/Password(ex. root/1234) 부분 및 DB경로를 알맞게 수정합니다.
5. webapp/resources/sql에서 **user.sql->country.sql->trip.sql** 순으로 테이블 생성 및 요소값을 입력합니다.
6. 사진 데이터의 경우 기본 사진을 제외한 나머지 부분은 **Sever**(절대경로가 아닌 상대경로)에서 돌아가게 됩니다. 따라서 home.jsp에 진입했을 때 사진 이미지가 안 잡힌다면 tomcat 서버가 작동 중일 때 resources/images 파일을 제거 후 다시 삽입해주시길 바랍니다. 혹은 C:\Users\username\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WanderSpace\resources 에 images 파일을 삽입해주시면 정상 작동 됩니다.
7. 모든 세팅이 끝나면 home.jsp에 진입하여 진행하시면 됩니다.

## 🖥Preview
- 홈페이지
<img src="https://github.com/user-attachments/assets/ce4421bb-45a9-442f-9978-68a5eca1ad4b" width=95%> <br>

- 모든 국가를 볼 수 있는 페이지
<img src="https://github.com/user-attachments/assets/60f9d780-9418-46d6-bca6-89090dee9275" width=95%> <br>

- 국가 별 작성된 모든 여행 후기를 볼 수 있는 페이지(국가별 수도 기준으로 날씨 제공)
<img src="https://github.com/user-attachments/assets/9c6f4e73-c58b-4ac4-99e6-c642215babb0" width=95%> <br>
<img src="https://github.com/user-attachments/assets/898274db-4491-4dae-b4d7-b224fbbe7637" width=95%> <br>

- 여행 후기 페이지(여행 후기 장소에 따라 날씨로 출력되는 장소도 업데이트)
<img src="https://github.com/user-attachments/assets/68825cee-ea3d-46b2-a9c2-d5827399cc4b" width=95%> <br>
<img src="https://github.com/user-attachments/assets/cc27793e-ea59-48ae-bc74-77952352d6ea" width=95%> <br>

- 로그인
<img src="https://github.com/user-attachments/assets/a4ad2ca9-b1d1-4c51-a55d-732708ba6608" width=95%> <br>

- 회원가입
<img src="https://github.com/user-attachments/assets/69209abe-0071-49e2-990a-429131038cc6" width=95%> <br>

- 마이페이지
<img src="https://github.com/user-attachments/assets/189b8067-f0f6-4cc3-8d1e-f69d1743588a" width=95%> <br>
- 여행 후기 작성 페이지
<img src="https://github.com/user-attachments/assets/30152c9a-9e8c-44f8-a227-c4fef8048804" width=95%> <br>

- 최근 7일간 본 여행 후기 페이지
<img src="https://github.com/user-attachments/assets/08627afb-21f7-4af9-9f73-c363de220794" width=95%> <br>

- 여행 후기 수정 페이지
<img src="https://github.com/user-attachments/assets/7e72b160-8311-4b8d-8147-afc4def6607e" width=95%> <br>
