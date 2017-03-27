var $productsContainer, containerWidth, smallBoxesWidth, bigBoxesWidth;

var counter = 0;
var topPointer = 0;
var leftPointer = 0;
var goToTop = false;
var doubleRowCounter = 0;
var randomNum, featuredBoxIndexes, featuredBoxDisplayed;

$(document).on('ready page:load', function (event) {

    setupResponsiveBoxes();
    //  setProductQuantity();

    setImagesGallery();
    setFuvoriteBtn();
});

/**************************/
/**************************/
/** Products Categories  **/
/**************************/
/**************************/

function setupResponsiveBoxes() {
    $productsContainer = $('.products-box-container .inner-container');
    containerWidth = $productsContainer.width();

    setSmallBoxes();
    setBigBoxes();
    setPositions();
    setBoxesContainer();
}

function setBoxesContainer() {
    var doubleRowsCount = Math.ceil($('.product-box').length / 7);
    var containerHeight = doubleRowsCount * bigBoxesWidth;

    $productsContainer.height(containerHeight)
}

function setSmallBoxes() {
    smallBoxesWidth = containerWidth / 5;
    $('.small-box').css({
        width: smallBoxesWidth,
        height: smallBoxesWidth
    });
}

function setBigBoxes() {
    bigBoxesWidth = smallBoxesWidth * 2;
    $('.big-box').css({
        width: bigBoxesWidth,
        height: bigBoxesWidth
    });
}

function setPositions() {

    counter = 0;
    doubleRowCounter = 0;
    goToTop = false;
    topPointer = 0;
    leftPointer = 0;
    featuredBoxDisplayed = false;

    featuredBoxIndexes = [1, 3, 5, 7];
    randomNum = Math.floor(Math.random() * featuredBoxIndexes.length) + 0;

    $('.product-box').each(function () {
        counter++;

        if ((counter % featuredBoxIndexes[randomNum] == 0) && !featuredBoxDisplayed) {
            $(this).setBigBox();
            featuredBoxDisplayed = true;
        } else {
            $(this).setSmallBox();
        }


        //Set Values for next loop
        if (goToTop) {
            if (!featuredBoxDisplayed) {
                if (counter % 2 == 0)
                    leftPointer += smallBoxesWidth;
            }

            if (featuredBoxDisplayed && !$(this).hasClass('big-box')) {
                if (counter % 2 != 0)
                    leftPointer += smallBoxesWidth;
            }
        }

        resetValues();

        topPointer = (goToTop) ? topPointerPosition() : (topPointer + smallBoxesWidth);
    });
}

function resetValues() {

    if (counter % 7 == 0) {

        leftPointer = 0;
        counter = 0;
        doubleRowCounter++;
        featuredBoxDisplayed = false;
        randomNum = Math.floor(Math.random() * featuredBoxIndexes.length) + 0;
    }
}

function topPointerPosition() {
    var doubleRowHeight = smallBoxesWidth * 2;
    return doubleRowHeight * doubleRowCounter;
}


jQuery.fn.extend({
    setSmallBox: function () {
        $(this).animate({
            top: topPointer,
            left: leftPointer
        });

        if (!featuredBoxDisplayed)
            goToTop = (counter % 2 == 0) && !goToTop ? true : false;

        if (featuredBoxDisplayed)
            goToTop = (counter % 2 != 0) && !goToTop ? true : false;

    }
});

jQuery.fn.extend({
    setBigBox: function () {
        $(this).addClass('big-box').css({
            width: bigBoxesWidth,
            height: bigBoxesWidth
        }).animate({
            top: topPointer,
            left: leftPointer
        });

        goToTop = true;

        leftPointer += smallBoxesWidth * 2;

    }


});


/**************************/
/**************************/
/****  Product Detail  ****/
/**************************/
/**************************/

function setImagesGallery() {
    $("#product-detail-zoom").elevateZoom({
        gallery: 'product-images-gallery',
        galleryActiveClass: 'active',
        zoomType: "inner",
        responsive: true,
        cursor: "crosshair",
        zoomWindowFadeIn: 500,
        zoomWindowFadeOut: 750
    });
}

function setFuvoriteBtn() {
    $(".add-favourites-btn").click( function(e){
        e.preventDefault();
        var url = $(this).attr('href');
        console.log(url);

        $.ajax({
            url: url,
            context: document.body,
            type: 'POST',
            data: {
                quantity: 1
            }
        }).done(function (data) {
            console.log('Done!', data);
        });

    });
}