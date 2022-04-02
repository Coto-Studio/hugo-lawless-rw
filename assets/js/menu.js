const navToggle = document.getElementById("nav-toggle");
const menuLinks = document.getElementsByClassName("menu-link");

function closeMenu() {
  navToggle.checked = false;
}

Array.from(menuLinks).forEach((link) => {
  link.addEventListener("click", closeMenu);
});
