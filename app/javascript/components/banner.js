import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Upgrade your life", "Rent a boat and sail away!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
