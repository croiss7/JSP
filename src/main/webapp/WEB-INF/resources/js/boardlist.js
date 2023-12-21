"use strict";
//@ts-nocheck
// fetch
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
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
function ajax(url, option) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, fetch(url, option).then(function (res) { return res.json(); })];
        });
    });
}
// fetch("/api/boardlist", {
//   method: "POST",
// })
//   .then((res) => res.json())
ajax("/api/boardlist", {
    method: "POST",
    Headers: {
        //내가 넘길 정보의 형식을 알려주는 것
        contentType: "multipart/form-data", //"application/json" 등등...
        authorization: "asdasd", // 보안 요청용 토큰 키값 = 이 요청은 받아도 괜찮습니다
        accept: "application/json", //서버에서 받을 데이터 예측값
        userAgent: "robots", // 내가 누구게 IOS? Win? 안드로이드?
    },
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
}).then(function (json) {
    console.log(json);
    var boards = document.querySelector("#boards");
    var template = document.querySelector("#boards template");
    for (var _i = 0, _a = json.data; _i < _a.length; _i++) {
        var data = _a[_i];
        template.content.querySelector(".id").innerHTML = data.id;
        template.content.querySelector(".title").innerHTML = data.title;
        template.content.querySelector(".author").innerHTML = data.boardUser.name;
        var div = document.createElement("div");
        div.innerHTML = template.innerHTML;
        boards.appendChild(div);
    }
}); //페이지의 규격만 만들어놓고 내부 내용은 json을 불러서 집어넣음
//filter
//유저요청 도메인 서블릿 도메인 유저
//어차피 들러야 하면 공장처럼
