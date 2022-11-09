

window.addEventListener('load', (event) => {
    let a = document.querySelector(".menubutton");
    a.addEventListener('click', (e) => {
      console.log("here");
      let menu = document.querySelectorAll(".expandingMenuItem");

      if ((menu[0]).style.display === 'none')
      {

        menu.forEach(menuItem => menuItem.style.display = 'unset');
      }
      else
      {
        menu.forEach(menuItem => menuItem.style.display = 'none');
      }
    });


});
