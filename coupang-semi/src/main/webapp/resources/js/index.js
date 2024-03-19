const navIcons = document.querySelectorAll(".header-main-bottom i");
const aList = document.querySelectorAll(".header-main-bottom a");

navIcons[0].addEventListener("click", function () {
  aList.forEach((a) => {
    a.classList.remove("header-main-bottom-right");
  });
});
navIcons[1].addEventListener("click", function () {
  aList.forEach((a) => {
    a.classList.add("header-main-bottom-right");
  });
});

// main
const mainImg = document.querySelectorAll("main > img");

// 첫번째 이미지에 main-img-active 클래스가 추가되어 있어요!
setInterval(() => {
  const className = "main-img-active";
  for (let i = 0; i < mainImg.length; i++) {
    // 첫번째 이미지에서는 클래스 제거, 두번째 이미지에 클래스 추가
    // 두번째 이미지에서는 클래스 제거, 세번째 이미지에 클래스 추가
    // 마지막 이미지에서는 클래스 제거, 첫번째 이미지에 클래스 추가
    if (mainImg[i].classList.contains(className)) {
      mainImg[i].classList.remove(className);

      // 마지막번째만 예외로 처리!
      if (i === mainImg.length - 1) {
        mainImg[0].classList.add(className);
        break;
      }

      mainImg[i + 1].classList.add(className);
      break;
    }
  }
}, 2000);

// 사용자가 스크롤을 내리는 순간 어느 시점에 나타나고
// 다시 올리면 사라지는..!
const categoryMenu = document.querySelector(".category-menu");
window.addEventListener("scroll", function () {
  console.log(window.scrollY);
  if (window.scrollY >= 1300) {
    categoryMenu.style.display = "flex";
  } else {
    categoryMenu.style.display = "none";
  }
});

// ajax로 카테고리 호출!
$.ajax({
  type: "get",
  url: "/category",
  success: function (list) {
    let htmlCode = "";

    for (const item of list) {
      htmlCode += `
      <div class="category-item">
        <i class="fa-solid ${item.cateIcon}"></i> 
        <span>${item.cateName}</span> 
        <i class="fa-solid fa-caret-right"></i>
        <div class="category-sub-item">
        <ul>
      `;
      for (const sub of item.subList) {
        htmlCode += `<li><a href="#">${sub.subName}</a></li>`;
      }
      htmlCode += `</ul>
      <img
        src="${item.cateUrl}"
        alt="" />
    </div>
  </div>`;
    }

    $(".category-list").append(htmlCode);
  },
});
