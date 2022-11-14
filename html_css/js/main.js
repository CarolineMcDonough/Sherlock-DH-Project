

window.addEventListener('load', (event) => {
  let a = document.querySelector("#menubutton");
  let menuItems = document.querySelector(".mobileMenu>div>table");
  menuItems.style.display = 'none';

  a.addEventListener('click', (e) => {
    let menu = document.querySelector(".mobileMenu>div");
    let menuItems = document.querySelector(".mobileMenu>div>table");
    let mainContent = document.querySelector("main");
    console.log(menuItems);

    if ((menuItems).style.display === 'none')
    {
      console.log("here");
      menuItems.style.display = 'unset';
      menu.style.width = "215px";
      mainContent.style.marginLeft = "205px";
    }
    else
    {
      menuItems.style.display = 'none';
      menu.style.width = "0";
      mainContent.style.marginLeft = "0";
    }
  });

});
