$(function () {
      var _delay = 600;

  // change the classes for project thumb image to static or animated
  $(".project-item .image-hover")
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