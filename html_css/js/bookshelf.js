

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

    let shelfList = document.querySelector(".bookshelf");


    shelfList.style.setProperty('--hoverRx', '0deg');
    shelfList.style.setProperty('--hoverRy', '-60deg');
    shelfList.style.setProperty('--hoverTy', '-10px');
    shelfList.style.setProperty('--hoverTx', '-120px');

    shelfList.addEventListener('click', (event) => {
        let clickedBook = event.target.parentElement;
        // Catch the case where the user clicks on the bookshelf but between the books
        // in this case the parent of the bookshelf is the body
        if(clickedBook === document.querySelector("body") || shelfList.classList.contains("minimizeBooks")){
            return;
        }
        let boundingclient = clickedBook.getBoundingClientRect();
        clickedBook.style.position = "absolute";
        clickedBook.style.top = boundingclient.top+"px";
        clickedBook.style.left = boundingclient.left+"px";
        let temp = clickedBook.cloneNode(true);
        shelfList.removeChild(clickedBook);
        document.querySelector("body").appendChild(temp);
        //We have clicked on a book. 
        //open it and move the books out of the way
        shelfList.classList.add("minimizeBooks");
        shelfList.style.justifyContent = "center";
        shelfList.style.gridTemplateColumns = "10% 10% 10%";
        shelfList.style.marginTop = "0";

        //smaller bookshelf has different hover behaviors
        shelfList.style.setProperty('--hoverRx', '-10deg');
        shelfList.style.setProperty('--hoverRy', '-10deg');
        shelfList.style.setProperty('--hoverTy', '-20px');
        shelfList.style.setProperty('--hoverTx', '0px');
    }, false);
});

