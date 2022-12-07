window.addEventListener('load', (event) => {
  let spines = Object.values(document.getElementsByClassName("spine"));
  let covers = Object.values(document.getElementsByClassName("cover"));
  let tops = Object.values(document.getElementsByClassName("top"));


  let availableColors = [
  "midnightblue",
  ];

  // assign a random height, pattern and colour to each book
  spines.map(function (s, i) {
  let randomHeight = getRandomInt(275, 275);
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

  //the once option removes the listener after a book is pressed once.
  bookshelf.addEventListener('click', (event) => handleBookAnimation(event) , {once: true});

});



function checkboxListeners() {
  // document.querySelectorAll(".female");
document.getElementById("actionMale").addEventListener("click", (e) => {
    if (e.target.checked) {
    //set male background stuff.
    document.querySelectorAll(".male").forEach((maleAction) => {
        maleAction.style.setProperty("font-style", "italic");
        maleAction.style.setProperty("color", "yellow");
        maleAction.style.setProperty("background-color", "midnightblue");
    });
    } else {
    document.querySelectorAll(".male").forEach((maleAction) => {
        maleAction.style.setProperty("font-style", "unset");
        maleAction.style.setProperty("color", "black");
        maleAction.style.setProperty("background-color", "transparent");
    });
    }
});
}

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function randomChoice(array) {
  return array[Math.floor(Math.random() * array.length)];
}

//why is this just out here like that.
let scale = .7;
if(window.innerWidth < 940){
  scale = 0.1; 
}

function handleBookAnimation(event) {
  let bookshelf = document.querySelector(".bookshelf");
  var clickedBook = event.target.parentElement;
  // console.log(clickedBook);
  // console.log(event.target);

  // Catch the case where the user clicks on the bookshelf but between the books
  // in this case the parent of the bookshelf is the body
  if(clickedBook === document.querySelector("body") || bookshelf.classList.contains("minimizeBooks") || clickedBook === document.querySelector("main") || clickedBook === bookshelf){
      return;
  }
  //else if title was clicked so the parent is the spine; go up one more parent and it should be the right book.
  else if(clickedBook.classList.contains("spine")){
    clickedBook = clickedBook.parentElement;
    // console.log({clickedBook});
  }
  document.querySelector("#storyTitle").style.display = "none";
  document.querySelector("#storyPage").style.transition = "500ms";
  document.querySelector("#storyPage").style.backdropFilter = "blur(5px)";


  let boundingclient = clickedBook.getBoundingClientRect();
  // clickedBook.style.position = "absolute";
  clickedBook.style.top = boundingclient.top+"px";
  clickedBook.style.left = boundingclient.left+"px";
  bookshelf.removeChild(clickedBook);
  //make a deep clone of the book that was clicked
  let temp = clickedBook.cloneNode(true);
  //add it to the main flexbox with the reading content, the control checkboxes, and the book that was clicked.
  //so the book that was clicked can move when the screensize is moved
  document.querySelector("#readingViewContentBox").appendChild(temp);
  //We have clicked on a book. 
  //open it and move the books out of the way

  //probably could be done with CSS maybe?
  bookshelf.classList.add("minimizeBooks");
  bookshelf.style.justifyContent = "center";
  bookshelf.style.marginTop = "0";
  bookshelf.style.position = "unset";

  //dont even know why ?
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
  bookshelf.style.setProperty('margin-left',  '20%');
  


  bookshelf.style.marginBottom = "-120%";
  document.querySelector("div.smallShelf").style.display = "unset";
  //inseting the bookshelf into the bar on the right side of the screen.
  document.querySelector("div.smallShelf").insertBefore(bookshelf, document.querySelector("div.smallShelf").firstChild);

  //unset the media query stuff for small screens
  if(scale === .1){
    temp.style.display = "unset";
  }
  bookshelf.addEventListener('animationstart', (e) => {
    // console.log('Animation ended');
    temp.style.left = "200px";
    temp.style.bottom = "300px";
    // console.log(boundingclient);
    temp.style.transform = `translateX(${window.innerWidth - 580}px)  translateY(-${boundingclient.top - boundingclient.height/8}px) scale(${scale})  rotateY(-60deg)`;
    //put the books in the div in the bottom. 
    //start the single book animation
  });
  //BAD CODE this is a super super long animationend listener the switch active book function should be in its own function
  bookshelf.addEventListener('animationend', (e) => {
    document.querySelector("div.storyText").style.display = 'unset';

    //After the book is pressed the css information of each book will correspond to a JS module containing 
    //the XML data of the books which has been made into html with the xslt transformations
    //the modules are imported like this inorder to drastically improve page load times. but the only issue is once 
    //they are loaded they cannot be unloaded.
    let bookNumber =  (clickedBook.querySelector(".spine-author").textContent)

    //take away the spaces and get the number from the number on the spine of the book
    let bookInt = parseInt((bookNumber.replace(/\s/g, '')).substring(1));
    let getText = async (bookInt) => {
      let a = await import(`./stories/story${bookInt}.js`);
      document.querySelector("#storyXMLbody").innerHTML = a.default;
      // console.log(text);
    }
    getText(bookInt);
    //add listeners for the checkboxes
    //only create once.
    //listening for all stories.
    checkboxListeners();

    document.querySelector('.smallShelf > .bookshelf').addEventListener('click', async (event) => await switchActiveBook(event));
    
    temp.style.top = temp.getBoundingClientRect().top - (temp.getBoundingClientRect().height*.21) + 'px';
    temp.style.left = "-60px";
    temp.style.position = "relative";
    temp.style.transition = "none";
    temp.style.marginLeft = "auto";
    if(scale === .1){
      temp.style.display = "none";
      return;
    }
    let text = "";

    temp.style.transform = `translateY(0px) translateX(-20px) scale(${scale}) rotateY(-60deg)`;
  });

}


//this function should not be nested it depends on some state from the outer function and this entire code is and very verbose.
let switchActiveBook = async (event) => {
  let bookshelf = document.querySelector(".bookshelf");
  var clickedBook = event.target.parentElement;

  // Catch the case where the user clicks on the bookshelf but between the books
  // in this case the parent of the bookshelf is the body
  if(clickedBook === document.querySelector("body") || clickedBook === document.querySelector("main") || clickedBook === bookshelf){
      return;
  }
  //else if title was clicked so the parent is the spine; go up one more parent and it should be the right book.
  else if(clickedBook.classList.contains("spine")){
    clickedBook = clickedBook.parentElement;
    // console.log({clickedBook});
  }

  //swap the books.
  currentBook = document.querySelector("#readingViewContentBox > .book");
  // console.log(Array.from(bookshelf.children).indexOf(clickedBook))
  
  // clickedBook.style = currBookInlineStylesCopy;

  currentBook.removeAttribute("style");
  clickedBook.removeAttribute("style");

  // clickedBook.style.transition = "1s"; 
  clickedBook.style.transform = `scale(${scale}) rotateY(-60deg)`;
  clickedBook.style.left = `-80px`;
  clickedBook.style.top = `40px`;
  clickedBook.style.marginLeft = `auto`;

  clickedIndex = Array.from(bookshelf.children).indexOf(clickedBook);
  bookshelf.insertBefore(currentBook, bookshelf.children[clickedIndex]);
  // document.querySelector("#readingViewContentBox").removeChild(currentBook);
  document.querySelector("#readingViewContentBox").appendChild(clickedBook);


  //remove the # sign from the book/story number

  bookNumber =  (clickedBook.querySelector(".spine-author").textContent)

  let bookNum = parseInt((bookNumber.replace(/\s/g, '')).substring(1));

  // document.querySelector("#storyXMLbody").innerHTML = "";
  //unset all the checkboxes.

  //unset all of the checkboxes
  document.querySelectorAll("input").forEach((ele) => {
    if(ele.checked === true){
      ele.checked = false;
    }
  });

  let a = (await import(`./stories/story${bookNum}.js`));
  document.querySelector("#storyXMLbody").innerHTML = a.default;
  // console.log(parseInt(bookInt,10));

}



