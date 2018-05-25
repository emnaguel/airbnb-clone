const navbar = document.querySelector('.navbar-wagon');
navbar.classList.add('navbar-wagon-transparent')
window.addEventListener('scroll', () => {
  if (window.scrollY >= window.innerHeight) {
    navbar.classList.add('navbar-wagon-white');
    navbar.classList.remove('navbar-wagon-transparent');

  } else {
    navbar.classList.remove('navbar-wagon-white');
    navbar.classList.add('navbar-wagon-transparent');
  }
});

