**프로그램 실행 메뉴얼**

1. node.js를 설치합니다. (설치할때 npm도 같이 설치됨)


2. 설치할때, 환경변수 설정을 한다는 부분에 체크를 하면(보통 이미 체크가 되어있음) 바로 환경변수에 경로 추가가 됩니다.


3. cmd에서 다운받은 Project 디렉토리로 들어갑니다.


4. npm install -s pm2 를 통해서 pm2를 설치해줍니다.(설치 후 아랫단계가 안된다면 -g로 다시 시도)


5. pm2 설치가 완료되었다면, Project 디렉토리에서 pm2 start app.js를 실행시킵니다.


6. 실행시킨 후 크롬 브라우저에서 localhost:3000/ 로 접속하면 프로그램 이용이 가능합니다.


7. 프로그램 이용이 다 끝난 후 cmd창에서 pm2 kill을 입력해주면 실행이 멈추게 됩니다.


(만약 위와 같이 했는데 실행이 안될 경우)

- express나 body-parser, mysql, cookie, sanitize-html을 찾을 수 없다는 에러라면

npm install -s express
npm install -s body-parser
npm install -s mysql 
npm install -s cookie
npm insatll -s sanitize-html

위의 명령어들을 차례로 실행시킨 후 해당 디렉토리에서 다시 pm2 start app.js를 실행시 프로그램 이용이 가능합니다.



**안내사항**

    amazon rds 인스턴스에 db가 올라가 있기에 dump 파일을 이용해서 따로 db에 추가하지 않아도
    프로그램은 정상적으로 돌아갑니다.

   Interface 폴더는 유저와 관리자 인터페이스를 위한 파일들을 담아둔 폴더입니다.

   db와 통신하고 데이터를 가져오는 쿼리문들은 모두 app.js에 존재하지만, 
   app.js만 따로 빼서 실행시 실행되지 않습니다. 프로그램 실행은 꼭 Project 디렉토리에서 실행해야합니다.

   주석은 통신을 다룬 app.js에 적어두었습니다. 나머지 파일들은 html을 모듈화하여 js로 저장해둔 파일과
   프론트에서 이용하는 css와 js 파일, 그리고 실행에 필요한 다양한 모듈입니다.
   user.js : 사용자 인터페이스, admin.js : 관리자 인터페이스
