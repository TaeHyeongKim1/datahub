Data Center를 근무했을때 일부분 필요하다고 느낀부분을 개인프로젝트에 최대한 녹여보았고 

배운부분에서 최고의 노력을 했다정도로만 귀엽게 봐주십시오.


Asset 관련 Dao , service, controller를 이용하여 장비 현황을 관리 하였습니다
user관련 MVC 를 이용하여 권한을 관리하였고 세션을 받아와 수정 할 수 있는 부분과 없는 부분을 구분해두었습니다
추후 Spring Security를 이용한 프로젝트도 진행해보고싶다는 생각이 들었습니다.

DatabaseBackupScheduler 같은경우는 데이터센터에서 기본적으로 필요했던 매일 저녁마다 변경사항을 파일로 저장해 관리하였고 사내 파일로 유지했던부분을 자동화 해보았습니다



![image](https://github.com/user-attachments/assets/45e2af3e-13e8-4cbf-8517-c5925911224e)
<br>메인 화면 입니다 사이드 바에서 Asset List를 누르면 

![image](https://github.com/user-attachments/assets/431e9fb5-58e3-46d1-9465-ef80053821bd)
<br>자산 들이 나오며 자산 상세버튼을 누르면

![image](https://github.com/user-attachments/assets/86c440a7-0e10-4f3f-80b0-73851545d6df)
<br>자산 상세가 나오며 수정과 삭제는 관리자만 가능하고
고객사로 접속한경우에는 할수 없도록 해두었습니다

![image](https://github.com/user-attachments/assets/aa28e2b7-2043-4018-83bd-c9c0cd7b13e8)
<br>수정은 모달창으로 진행하였습니다

![image](https://github.com/user-attachments/assets/b522414d-86bf-47d7-9e48-409c7933a367)
<br>QNA 게시판을 이용하여 서버 입출고를 관리하였습니다

![image](https://github.com/user-attachments/assets/148600e6-cb2d-4a4f-bced-af597e16ca60)
<br>DatabaseBackupScheduler를 이용하여

![image](https://github.com/user-attachments/assets/3d238a8a-7614-49c0-8b6f-2cb00d322501)
<br>매 자정마다 백업파일이 저장되는것을 볼수있습니다
