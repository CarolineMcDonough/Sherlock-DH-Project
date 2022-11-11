

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

    bookshelf.addEventListener('click', (event) => {
        var clickedBook = event.target.parentElement;
        // Catch the case where the user clicks on the bookshelf but between the books
        // in this case the parent of the bookshelf is the body
        if(clickedBook === document.querySelector("body") || bookshelf.classList.contains("minimizeBooks")){
            return;
        }
        let boundingclient = clickedBook.getBoundingClientRect();
        clickedBook.style.position = "absolute";
        clickedBook.style.top = boundingclient.top+"px";
        clickedBook.style.left = boundingclient.left+"px";
        let temp = clickedBook.cloneNode(true);
        bookshelf.removeChild(clickedBook);
        document.querySelector("body").appendChild(temp);
        //We have clicked on a book. 
        //open it and move the books out of the way
        bookshelf.classList.add("minimizeBooks");
        bookshelf.style.justifyContent = "center";
        bookshelf.style.gridTemplateColumns = "fr fr fr fr" ;
        bookshelf.style.marginTop = "0";


        //CSS set variable for where the animation should go.
        bookshelf.style.setProperty('--xPos', `${-10}px`);
        bookshelf.style.setProperty('--yPos', '-120px');

        //smaller bookshelf has different hover behaviors
        bookshelf.style.setProperty('--hoverRx', '-10deg');
        bookshelf.style.setProperty('--hoverRy', '-10deg');
        bookshelf.style.setProperty('--hoverTy', '-20px');
        bookshelf.style.setProperty('--hoverTx', '0px');

        bookshelf.style.marginBottom = "-120%";
        document.querySelector("div.smallShelf").style.display = "unset";
        document.querySelector("div.smallShelf").insertBefore(bookshelf, document.querySelector("div.smallShelf").firstChild);
        bookshelf.addEventListener('animationstart', (e) => {
          console.log('Animation ended');

          console.log(window.innerWidth , clickedBook.style.left);
          temp.style.transform = `translateY(-${boundingclient.top}px) translateX(${window.innerWidth*0.86 - parseInt(clickedBook.style.left)}px) rotateY(-60deg)`;
          //put the books in the div in the bottom. 
          //start the single book animation
        });
        bookshelf.addEventListener('animationend', (e) => {
          document.querySelector("div.storyText").style.display = 'unset';
        });
    }, false);
});

