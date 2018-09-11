document.getElementById("cart").onmouseover = function(){

    // document.getElementById("mini-cart-sub").style.display = "block";
    document.getElementById("mini-cart-sub").classList.add("showCart");
    document.getElementById("mini-cart-sub").classList.remove("hiddenCart");
};

document.getElementById("cart").onmouseout = function(){

    // document.getElementById("mini-cart-sub").style.display = "none";
    document.getElementById("mini-cart-sub").classList.add("hiddenCart");
    document.getElementById("mini-cart-sub").classList.remove("showCart");
};

document.getElementById("mini-cart-sub").onmouseover = function(){

    // document.getElementById("mini-cart-sub").style.display = "block";
    document.getElementById("mini-cart-sub").classList.add("showCart");
    document.getElementById("mini-cart-sub").classList.remove("hiddenCart");
};

document.getElementById("mini-cart-sub").onmouseout = function(){

    // document.getElementById("mini-cart-sub").style.display = "none";
    document.getElementById("mini-cart-sub").classList.add("hiddenCart");
    document.getElementById("mini-cart-sub").classList.remove("showCart");
};
