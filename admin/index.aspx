<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_INDEX" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8" />
  <title>GSAP Slider</title>
  <link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Barlow&family=Work+Sans&display=swap" rel="stylesheet" />
    <link href="../css/index.css" rel="stylesheet" />
</head>
<body>
<!-- partial:index.partial.html -->
<main>
  <div class="slides-container">
    <div class="slides-inner">
      
      <div class="slide slide-1">
        <div class="filter"></div>
        <div class="info-container">
          <div class="info-inner">
            <div class="title">
              <h2>"Veggie Delight <br /> Burger Selection"</h2>
            </div>
          </div>
        </div>
      </div>
      
      <div class="slide slide-2">
        <div class="filter"></div>
        <div class="info-container">
          <div class="info-inner">
            <div class="title">
              <h2>"Fizz & Flavorful <br /> Drinks"</h2>
            </div>
          </div>
        </div>
      </div>
      
      <div class="slide slide-3">
        <div class="filter"></div>
        <div class="info-container">
          <div class="info-inner">
            <div class="title">
              <h2>"Golden Crisp <br /> French Fries"</h2>
            </div>
          </div>
        </div>
      </div>

      <div class="slide slide-4">
        <div class="filter"></div>
        <div class="info-container">
          <div class="info-inner">
            <div class="title">
               <h2>"Combo <br /> Offers"</h2>
            </div>
          </div>
        </div>
      </div>
    
    <div id="progress-container">
      <div id="progressBar"></div>
    </div>
  </div>
      </div>
</main>
<!-- partial -->
  <script src='https://cdn.jsdelivr.net/npm/gsap@3.0.5/dist/gsap.min.js'></script>
<!-- <script src='https://cdn.jsdelivr.net/npm/gsap@3.0.5/dist/Draggable.min.js'></script> -->
<!-- <script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/InertiaPlugin.min.js'></script> -->
<script>
    console.clear();

    //SLIDES
    var slideDelay = 5;
    var slideDuration = 1.5;

    var slides = document.querySelectorAll(".slide");

    var numSlides = slides.length;

    for (var i = 0; i < numSlides; i++) {
        gsap.set(slides[i], {
            xPercent: i * 100,
            willChange: "transform"
        });
    }

    var timer = gsap.delayedCall(slideDelay, autoPlay);

    var animation = gsap.to(slides, {
        duration: 1,
        xPercent: "+=" + (numSlides * 100),
        ease: "none",
        paused: true,
        repeat: -1,
        modifiers: {
            xPercent: gsap.utils.wrap(-100, (numSlides - 1) * 100)
        }
    });

    var proxy = document.createElement("div");
    gsap.set(proxy, { x: 0 });
    var slideAnimation = gsap.to({}, { duration: 0.1 });
    var slideWidth = 0;
    var wrapWidth = 0;
    resize();

    window.addEventListener("resize", resize);

    function animateSlides(direction) {
        timer.restart(true);
        slideAnimation.kill();

        var x = gsap.getProperty(proxy, "x") + direction * slideWidth;

        slideAnimation = gsap.to(proxy, {
            duration: slideDuration,
            x: x,
            onUpdate: updateProgress,
            ease: "power4.inOut"
        });
    }

    function autoPlay() {
        animateSlides(-1);
    }

    function updateProgress() {
        animation.progress(gsap.utils.wrap(0, 1, gsap.getProperty(proxy, "x") / wrapWidth));
    }

    function resize() {
        var norm = (gsap.getProperty(proxy, "x") / wrapWidth) || 0;

        slideWidth = slides[0].offsetWidth;
        wrapWidth = slideWidth * numSlides;

        gsap.set(proxy, {
            x: norm * wrapWidth
        });

        animateSlides(0);
        slideAnimation.progress(1);
    }

    //PROGRESS BAR
    var progressBar = "#progressBar";
    var progressAnimation = gsap.timeline({
        paused: true,
        delay: 1.5,
        repeat: -1
    });

    progressAnimation.to(progressBar, {
        width: '100%',
        ease: 'none',
        duration: 3.5
    });
    progressAnimation.to(progressBar, {
        opacity: 0,
        ease: 'none',
        duration: 1.5
    });

    progressAnimation.play();

    //BACKGROUND
    var bg = ".slide";
    var bgAnimation = gsap.timeline({
        paused: true,
        delay: 5.5,
        repeat: -1,
        repeatDelay: 4
    });

    bgAnimation
    .set(bg, {
        backgroundSize: '140%'
    })
    .to(bg, {
        backgroundSize: '-=10%',
        ease: 'none',
        duration: 1
    });

    bgAnimation.play();

    function debounce(func, wait, immediate) {
        var timeout;
        return function () {
            var context = this,
              args = arguments;
            var later = function () {
                timeout = null;
                if (!immediate) func.apply(context, args);
            };
            var callNow = immediate && !timeout;
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
            if (callNow) func.apply(context, args);
        };
    }

    var debouncedResize = debounce(resize, 400); // Adjust the debounce time as needed
    window.addEventListener("resize", debouncedResize);

</script>

</body>
</html>
</asp:Content>

