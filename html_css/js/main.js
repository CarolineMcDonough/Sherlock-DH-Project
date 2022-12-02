

window.addEventListener('load', (event) => {
  let a = document.querySelector("#menubutton");
  let menuItems = document.querySelector(".mobileMenu>div>table");
  menuItems.style.display = 'none';

  a.addEventListener('click', (e) => {
    let menu = document.querySelector(".mobileMenu>div");
    let menuItems = document.querySelector(".mobileMenu>div>table");
    let mainContent = document.querySelector("main");

    let moveBooks = document.querySelector(".smallShelf");
    console.log(menuItems);

    let path = window.location.pathname;
    let page = path.split("/").pop();
    console.log(menu.style.width);
    //if the menu is not showing or if i have not set the style property yet.
    if (menu.style.width === '0px' || !menu.style.width)
    {

      if(page === "stories.xhtml"){
        mainContent.style.transform = "translateX(200px)";
        moveBooks.style.marginLeft = "10px";
      }
      else{
        mainContent.style.marginLeft = "205px";
      }

      menuItems.style.display = 'unset';
      menu.style.width = "215px";
    }
    else
    {
      // menuItems.style.display = 'none';
      menu.style.width = "0px";
      mainContent.style.marginLeft = "0";

      //on the stories page the xslt picker bar needs to be shifted and also the storied page has a different way of moving the main content
      if(page === "stories.xhtml"){
        mainContent.style.transform = "translateX(0px)";
        moveBooks.style.marginLeft = "0px";
      }
    }
  });

});
