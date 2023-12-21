//@ts-nocheck
// fetch

// Ajax 이름은 크게 두 개

// Ajax 기본 통신형 대분류 명칭
// Jquery  Ajax 기술 명칭이 Ajax
// XMLHttpRequest -> 클래스 생성해서 보내는 방식

// XMLHttpRequest name = new XMLHttpRequest();
// ().().().()...(((.....()()(((),..귀찮아요

// fetch함수 씀

// fetch(url)
// url과 옵션을 넣으면 url로 req를 보내고 resp를 받는 일방형 통신 기술

// 함수를 통해서 페이지 변경없이 정보만 주고받음

// 페이지 이동이 특별히 필요하지 않으면 굳이 안 함

// 그러면 fetch는 결과값으로 뭘 돌려주냐
// Promise 형태로 받아옴

// .then() 이걸로 후속 조치 한다

async function ajax(url: string, option?: any) {
  return fetch(url, option).then((res) => res.json());
}

// fetch("/api/boardlist", {
//   method: "POST",
// })
//   .then((res) => res.json())

//form-data가 파일을 전송할 때 자동적으로 boundary작업을 함
//경계선이 만들어지는데 추가로 붙인 contentType 이 고장남
// 그래서 header는 비워서 보내자

//Encrypt Data -> 암호화 정보
//니가 암호화해서 보내
//필터에서 복호화
//내가 받아서 비교

//AjaxFilter에 password로 hello를 보내면
//hello + encodeData 전송
//서버에서는 AjaxFilter는  encodeData 떼고 출력

let form: FormData = new FormData();
form.append("password", "Hello+EncodedData");

ajax("/api/boardlist", {
  method: "POST",
  //headers: {
  //내가 넘길 정보의 형식을 알려주는 것
  //"Content-Type": "multipart/form-data", //"application/json" 등등...
  //Authorization: "asdasd", // 보안 요청용 토큰 키값 = 이 요청은 받아도 괜찮습니다
  //accept: "application/json", //서버에서 받을 데이터 예측값
  // "User-Agent": "robots", // 내가 누구게 IOS? Win? 안드로이드?
  //},
  //body: "내용" 이렇게 단순 글을 보내거나  , new FormData()처럼 형식화해서 getParameter에 분석되도록 보냄
  mode: "cors", //서브처리 방식 바꾸면 운영체제마다 다르게 보내줘야 함

  cache: "default",
  //no-store      저장금지
  //reload         캐시 있어도 새로 만들어
  //no-cache      인증 검사용 캐시를 쓰지 않음
  //force-cache   한번 캐시 남으면 검사 안함
  //only-if-cachedaos 맨 처음에만 확인함

  redirect: "follow", //서버에서 가라면 가
  //"error" 가지마
  //"menual" forward말고 니가 직접 이동해
  refererr: "no-referrer",
  //strict-origin 같은 도메인 출신이라면 보내 줄 거야
}).then((json) => {
  console.log(json);
  let boards: HTMLElement = document.querySelector("#boards");
  let template: HTMLTemplateElement =
    document.querySelector("#boards template");

  for (let data of json.data) {
    template.content.querySelector(".id").innerHTML = data.id;
    template.content.querySelector(".title").innerHTML = data.title;
    template.content.querySelector(".author").innerHTML = data.boardUser.name;
    let div: HTMLElement = document.createElement("div");
    div.innerHTML = template.innerHTML;
    boards.appendChild(div);
  }
}); //페이지의 규격만 만들어놓고 내부 내용은 json을 불러서 집어넣음

//filter
//유저요청 -> 도메인 ->  서블릿 -> 도메인 -> 유저
//                                  순으로 요청과 정보가 전달됨

//어차피 들러야 하면 공장처럼 중간에 처리 과정을 하나 더 넣자.
//이게 필터
