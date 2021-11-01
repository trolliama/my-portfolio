function changeCss() {
  var divProjectsNav = document.querySelector("#projects-navbar");

  if (!divProjectsNav) {
    return;
  }

  var navElement = divProjectsNav.querySelector(".navbar");
  var logoElement = divProjectsNav.querySelector(".navbar-brand");

  if (this.scrollY > 500) {
    navElement.classList.remove("navbar-dark");
    navElement.classList.add("navbar-light");

    logoElement.style.filter =
      "invert(0%) sepia(84%) saturate(7437%) hue-rotate(328deg) brightness(114%) contrast(89%)";
  } else {
    navElement.classList.remove("navbar-light");
    navElement.classList.add("navbar-dark");

    logoElement.style.filter =
      "invert(100%) sepia(1%) saturate(178%) hue-rotate(344deg) brightness(117%) contrast(100%)";
  }
}
changeCss();
window.addEventListener("scroll", changeCss, false);
