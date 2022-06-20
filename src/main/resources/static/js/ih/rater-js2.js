window.raterJs({
   element: document.querySelector("#step"), 
    starSize: 32,
    rateCallback:function rateCallback(rating, done) {
        this.setRating(rating); 
        done(); 
    }
})

