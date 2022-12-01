

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function randomChoice(array) {
  return array[Math.floor(Math.random() * array.length)];
}

window.addEventListener('load', (event) => {
    let spines = Object.values(document.getElementsByClassName("spine"));
    let covers = Object.values(document.getElementsByClassName("cover"));
    let tops = Object.values(document.getElementsByClassName("top"));


    let availableColors = [
    "maroon",
    "darkgreen",
    "darkolivegreen",
    "brown",
    "saddlebrown",
    "sienna",
    "midnightblue",
    ];

    // assign a random height, pattern and colour to each book
    spines.map(function (s, i) {
    let randomHeight = getRandomInt(220, 290);
    s.style.height = `${randomHeight}px`;
    s.style.top = `${280 - randomHeight}px`;

    // let randomPattern = randomChoice(availablePatterns);
    // s.style.backgroundImage = `var(${randomPattern})`;

    let randomColor = randomChoice(availableColors);
    s.style.backgroundColor = randomColor;

    covers[i].style.height = `${randomHeight}px`;
    covers[i].style.top = `${280 - randomHeight}px`;

    tops[i].style.top = `${280 - randomHeight}px`;
    });

    // CODE I WROTE

    let bookshelf = document.querySelector(".bookshelf");


    bookshelf.style.setProperty('--hoverRx', '0deg');
    bookshelf.style.setProperty('--hoverRy', '-60deg');
    bookshelf.style.setProperty('--hoverTy', '-10px');
    bookshelf.style.setProperty('--hoverTx', '-120px');

    let scale = .7;
    if(window.innerWidth < 940){
      scale = 0.1; 
    }

    bookshelf.addEventListener('click', (event) => {
      document.querySelector("#storyTitle").style.display = "none";
      document.querySelector("#storyPage").style.transition = "500ms";
      document.querySelector("#storyPage").style.backdropFilter = "blur(5px)";
        var clickedBook = event.target.parentElement;
        // console.log(clickedBook);
        // console.log(event.target);

        // Catch the case where the user clicks on the bookshelf but between the books
        // in this case the parent of the bookshelf is the body
        if(clickedBook === document.querySelector("body") || bookshelf.classList.contains("minimizeBooks") || clickedBook === document.querySelector("main") || clickedBook === bookshelf){
            return;
        }
        let boundingclient = clickedBook.getBoundingClientRect();
        // clickedBook.style.position = "absolute";
        clickedBook.style.top = boundingclient.top+"px";
        clickedBook.style.left = boundingclient.left+"px";
        bookshelf.removeChild(clickedBook);
        let temp = clickedBook.cloneNode(true);
        document.querySelector("#readingViewContentBox").appendChild(temp);
        //We have clicked on a book. 
        //open it and move the books out of the way
        bookshelf.classList.add("minimizeBooks");
        bookshelf.style.justifyContent = "center";
        bookshelf.style.gridTemplateColumns = "fr fr fr fr" ;
        bookshelf.style.marginTop = "0";
        bookshelf.style.position = "unset";

        document.querySelector("#menubutton").style.zIndex="20";
        document.querySelector("#homebutton").style.zIndex="20";


        //CSS set variable for where the animation should go.
        bookshelf.style.setProperty('--xPos', `${-35}px`);
        bookshelf.style.setProperty('--yPos', '-120px');

        //smaller bookshelf has different hover behaviors
        bookshelf.style.setProperty('--hoverRx', '-10deg');
        bookshelf.style.setProperty('--hoverRy', '-10deg');
        bookshelf.style.setProperty('--hoverTy', '-20px');
        bookshelf.style.setProperty('--hoverTx', '0px');

        bookshelf.style.marginBottom = "-120%";
        document.querySelector("div.smallShelf").style.display = "unset";
        document.querySelector("div.smallShelf").insertBefore(bookshelf, document.querySelector("div.smallShelf").firstChild);

        //unset the media query stuff for small screens
        if(scale === .1){
          temp.style.display = "unset";
        }
        bookshelf.addEventListener('animationstart', (e) => {
          console.log('Animation ended');
          temp.style.left = "200px";
          temp.style.bottom = "300px";
          console.log(boundingclient);
          temp.style.transform = `translateX(${window.innerWidth - 605}px)  translateY(-${boundingclient.top - boundingclient.height/10}px) scale(${scale})  rotateY(-60deg)`;
          //put the books in the div in the bottom. 
          //start the single book animation
        });
        bookshelf.addEventListener('animationend', (e) => {
          document.querySelector("div.storyText").style.display = 'unset';

          temp.style.top = temp.getBoundingClientRect().top - (temp.getBoundingClientRect().height*.21) + 'px';
          temp.style.left = "-80px";
          temp.style.position = "relative";
          temp.style.transition = "none";
          temp.style.marginLeft = "auto";
          if(scale === .1){
            temp.style.display = "none";
            return;
          }
          temp.style.transform = `translateY(0px) translateX(-20px) scale(${scale}) rotateY(-60deg)`;
        });

    }, false);
});

