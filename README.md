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
<img srv="https://github.com/user-attachments/assets/ce4421bb-45a9-442f-9978-68a5eca1ad4b" width=95%> <br>

- 모든 국가를 볼 수 있는 페이지
![image](https://github.com/user-attachments/assets/1b270d6a-878f-4559-a251-8140edd9aa69)

- 국가 별 작성된 모든 여행 후기를 볼 수 있는 페이지(국가별 수도 기준으로 날씨 제공)
![image](https://github.com/user-attachments/assets/1ed9e08e-c6c0-4779-9c00-002f4b2f41f9)
![image](https://github.com/user-attachments/assets/7fc49c7c-bdd1-4d17-baac-5ec8b1af54b6)

- 여행 후기 페이지(여행 후기 장소에 따라 날씨로 출력되는 장소도 업데이트)
![image](https://github.com/user-attachments/assets/3c4b8daf-4b0a-4bd9-ab8c-014c3869842c)
![image](https://github.com/user-attachments/assets/8ffe1be2-fbc2-4b38-bef7-13b6e8e0641a)

- 로그인
![image](https://github.com/user-attachments/assets/3f93e456-ce44-489c-8b51-50340190b53a)

- 회원가입
![image](https://github.com/user-attachments/assets/6969242d-7e5b-43da-bb29-79f06ef4be5e)

- 마이페이지
![image](https://github.com/user-attachments/assets/7faa8efc-466f-4b40-963b-6ad00276eb0a)

- 여행 후기 작성 페이지
![image](https://github.com/user-attachments/assets/125e35f9-0351-42cb-96d8-0ba83bfc8691)

- 최근 7일간 본 여행 후기 페이지
![image](https://github.com/user-attachments/assets/fb86e4a2-59d3-408d-a537-1eb7f8aaca47)

- 여행 후기 수정 페이지
![image](https://github.com/user-attachments/assets/541af14c-6652-4672-9907-c977d6ad84b3)
