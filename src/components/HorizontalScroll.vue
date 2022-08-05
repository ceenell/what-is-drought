<template>
  <div class="another-container">
    <div id="title-container">
        <h2>40 years of drought</h2>
      </div>
    <div class="chart-container">
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

.chart-container {
  height: 85vh;
  max-height: 700px;
  width: auto;
  position: fixed;
  top:10vh;
  left: 0vh;
  margin-bottom: 5%;
  max-width: 800px;
}

body {
  overflow-x: hidden;
}

#container {
  background-color:grey;
  display:flex;
  flex-wrap:wrap;
  flex-direction:column;
  height:100%;
}

.module{
  height:100%;
  display:flex;
}

.green{
  width:500px;
  background-color:rgb(177, 225, 236);
  opacity: 0.4;
}

.yellow{
  width:1300px;
  background-color:rgb(223, 191, 245);
  opacity: 0.4;
}

.purple{
  width:800px;
  background-color:rgb(253, 183, 186);
  opacity: 0.4;
}

.orange{
  width:800px;
  background-color:rgb(252, 221, 153);
  opacity: 0.4;
}

.blue{
  width:2100px;
  background-color:rgb(199, 255, 188);
  opacity: 0.4;
}

</style>