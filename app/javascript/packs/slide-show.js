const images = ["images/visual-1.jpg", "images/visual-2.jpg", "images/visual-3.jpg"]

let num = -1

function slideShow_timer(){
  if (num === 2){
    num = 0;
  }
  else{
    num ++;
  }

  document.getElementById("main-visual__images-js").src = images[num];
  
}

setInterval(slideShow_timer, 5000);