window.raterJs({
    element:document.querySelector("#step"),
    rateCallback:function rateCallback(rating, done) {
        this.setRating(rating); 
        done(); 
    },
    starSize:32,
    step:0.5
})

