function changeCss() {
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
changeCss();
window.addEventListener("scroll", changeCss, false);
