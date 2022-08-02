<template>
  <div class="another-container">
    <div class="chart-container">
      <div id="title-container">
        <h2>40 years of drought</h2>
      </div>
      <div id="container">
        <div class="module green"></div>
        <div class="module yellow"></div>
        <div class="module purple"></div>
        <div class="module orange"></div>
        <div class="module blue"></div>
        <div class="module red"></div>
      </div>
  </div>
    </div>
</template>
<script>
import { store } from '../store/store.js'
import { isMobile } from 'mobile-device-detect';
import { ScrollTrigger } from "gsap/ScrollTrigger"; // animated scroll events
import { TimelineMax } from "gsap/all";
export default {
  name: "DroughtThresholds",
    components: {
    },
    props: {
    },
    data() {
      return {
        publicPath: process.env.BASE_URL, // allows the application to find the files when on different deployment roots
        mobileView: isMobile, // test for mobile
        text: scrollyText.frames, // scolly text

        // dimensions
        w: store.state.windowWidth,
        h: store.state.windowHeight,
        margin: { top: 50, right: 50, bottom: 50, left: 50 },

        // show scroll trigger markers on the page?
        marker_on: false,

        // storing unique id and text for each scroll step
        // TODO: move outside of component to separate json
      }
  },
  mounted(){      
    // register plugins for global use
      this.$gsap.registerPlugin(ScrollTrigger, TimelineMax); 

      // create the scrolling timeline
      let tl = this.$gsap.timeline(); 

      let container = document.getElementById("container");

      this.$gsap.to(container, {
        x: () => -(container.scrollWidth - document.documentElement.clientWidth) + "px",
        ease: "none",
        scrollTrigger: {
          trigger: container,
          invalidateOnRefresh: true,
          pin: true,
          scrub: 1,
          end: () => "+=" + container.offsetWidth
        }
      })

    },
    methods:{
      isMobile() {
              if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
                  return true
              } else {
                  return false
              }
          }
    }
}
</script>
<style scoped lang="scss">
// handwriting font
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
$writeFont: 'Nanum Pen Script', cursive;
// frames are stacked and class is added on an off w/ scroll trigger to bring to front
img {
  max-width: 80vw;
}
#title-container {
  position: fixed;
}
#scroll-container {
  z-index: 200;
}
.text-container {
  z-index: 500;
  border-radius: 25px;
  background-color: #333534;
  max-width: 400px;
  p{
    padding: 25px;
  }
}
.hydro-chart {
  height: auto;
  margin-top: 10%;
  margin-left: 10%;
  background-color: white;
  max-height: 700px;
    max-width: 1000px;
    opacity: 0;
    width: 65vw;
}

// stacking all images and using toogleClass to change visibility with scrolling
.hydro-chart {
  position: fixed;
  top: 10%;
  left: 35vh;
  @media screen and (max-width: 600px) {
    top: 25%;
  }
}
.chart-container {
  //background-position: top;
  height: 85vh;
  max-height: 700px;
  width: 50vw;
  position: relative;
  top:10vh;
  left: 0vh;
  margin-bottom: 5%;
  max-width: 800px;
}
// currently empty scoll-by divs used to trigger animation
.scrolly {
  height: 100vh;
   z-index: 100;
  p {
    max-width: 700px;
    color: white;
  }
}
.onTop {
  visibility: visible;
  z-index: 10;
  opacity: 1;
}
#spacer {
  height: 30vh;
}
.unstuck {
  position: relative;
}
body {
  overflow-x: hidden;
}

#container {
  background-color:grey;
  display:flex;
  flex-wrap:wrap;
  flex-direction:column;
  height:100vh;
}

.module{
  height:100%;
  display:flex;
}

.green{
  width:500px;
  background-color:green;
}

.yellow{
  width:1300px;
  background-color:yellow;
}

.purple{
  width:800px;
  background-color:purple;
}

.orange{
  width:800px;
  background-color:purple;
}

.blue{
  width:2100px;
  background-color:blue;
}

.red{
  width:900px;
  background-color:red;
}
</style>