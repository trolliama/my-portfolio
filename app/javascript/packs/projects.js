function changeNavLogoCss() {
  var divProjectsNav = document.querySelector("#projects-navbar");

  if (!divProjectsNav) {
    return;
  }

  var navElement = divProjectsNav.querySelector(".navbar");
  var logoElement = divProjectsNav.querySelector(".navbar-brand");

  if (this.scrollY > 490) {
    navElement.classList.remove("navbar-dark");
    navElement.classList.add("navbar-light");

    logoElement.classList.remove("logo-white");
    logoElement.classList.add("logo-dark");
  } else {
    navElement.classList.remove("navbar-light");
    navElement.classList.add("navbar-dark");

    logoElement.classList.remove("logo-dark");
    logoElement.classList.add("logo-white");
  }
}
changeNavLogoCss();
window.addEventListener("scroll", changeNavLogoCss, false);

$(function () {
      var _delay = 600;

  // change the classes for project thumb image to static or animated
  $("#projects .image-hover")
    .on("mouseenter", function () {
      var element = $(this);

      setTimeout(function () {
        element.find("img.static").css("display", "none");
        element.find("img.animated").css("display", "inline");
      }, _delay);
    })
    .on("mouseleave", function () {
      var element = $(this);

      setTimeout(function () {
        element.find("img.static").css("display", "inline");
        element.find("img.animated").css("display", "none");
      }, _delay);
    });
});
