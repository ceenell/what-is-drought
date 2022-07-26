<template>
<div class="another-container">
  <div class="chart-container">
    <div id="title-container">
      <h2>What is hydrological drought?</h2>
    </div>
      <img 
      class="hydro-chart onTop" 
      id="step-a"
      src="@/assets/images/threshold-chart/a.png"
    />
     <img 
      class="hydro-chart" 
      id="step-b"
      src="@/assets/images/threshold-chart/b.png"
    />
     <img 
      class="hydro-chart" 
      id="step-c"
      src="@/assets/images/threshold-chart/c.png"
    />
     <img 
      class="hydro-chart" 
      id="step-d"
      src="@/assets/images/threshold-chart/d.png"
    />
     <img 
      class="hydro-chart" 
      id="step-e"
      src="@/assets/images/threshold-chart/e.png"
    />
     <img 
      class="hydro-chart" 
      id="step-f"
      src="@/assets/images/threshold-chart/f.png"
    />
     <img 
      class="hydro-chart" 
      id="step-g"
      src="@/assets/images/threshold-chart/g.png"
    />


  </div>
   <div class="empties empty-container2" />
    <div class="empties empty-container3" />
    <div class="empties empty-container4" />
    <div class="empties empty-container5" />
    <div class="empties empty-container6" />
    <div class="empties empty-container7" />
  </div>
</template>
<script>
import * as d3Base from 'd3';
import { store } from '../store/store.js'
import { isMobile } from 'mobile-device-detect';
import { ScrollToPlugin } from "gsap/ScrollToPlugin"; // to trigger scroll events
import { ScrollTrigger } from "gsap/ScrollTrigger"; // animated scroll events
import { TimelineMax } from "gsap/all";

export default {
  name: "thresholds",
    components: {
    },
    props: {
    },
    data() {
      return {
        title: 'Streamflow drought',
        publicPath: process.env.BASE_URL, // this is need for the data files in the public folder, this allows the application to find the files when on different deployment roots
        d3: null,
        store,
        mobileView: isMobile, // test for mobile
        step: 0,


        // dimensions
        w: store.state.windowWidth,
        h: store.state.windowHeight,
        margin: { top: 50, right: 50, bottom: 50, left: 50 },
        svg_chart: null,

        }
  },
  mounted(){      
      this.d3 = Object.assign(d3Base);
      this.$gsap.registerPlugin(ScrollToPlugin, ScrollTrigger, TimelineMax); // register gsap plugins for scrollTrigger 
 
      this.step = 1;

      let tl = this.$gsap.timeline(); // create the timeline
      tl.to(".empty-container2", {
        scrollTrigger: {
          trigger: ".empty-container2",
          start: "top 50%", // when the animation starts
          end:() => `+=${document.querySelector(".empty-container2").offsetHeight}`, // when center of trigger is 20% down of top of vp, trigger ends
          toggleClass: {targets: "#step-b", className: "onTop" }, // add a class at trigger. could use to make fixed
          toggleActions: "restart none none none"
        }
        }).to(".empty-container3", {
        scrollTrigger: {
          trigger: ".empty-container3",
          start: "top 50%", // when the animation starts
          end:() => `+=${document.querySelector(".empty-container3").offsetHeight}`, // when center of trigger is 20% down of top of vp, trigger ends
          toggleClass: {targets: "#step-c", className: "onTop" }, // add a class at trigger. could use to make fixed
          toggleActions: "restart none none none"
        }
        }).to(".empty-container4", {
        scrollTrigger: {
          trigger: ".empty-container4",
          start: "top 50%", // when the animation starts
          end:() => `+=${document.querySelector(".empty-container4").offsetHeight}`, // when center of trigger is 20% down of top of vp, trigger ends
          toggleClass: {targets: "#step-d", className: "onTop" }, // add a class at trigger. could use to make fixed
          toggleActions: "restart none none none"
        }
      }).to(".empty-container5", {
        scrollTrigger: {
          trigger: ".empty-container5",
          start: "top 50%", // when the animation starts
          end:() => `+=${document.querySelector(".empty-container5").offsetHeight}`, // when center of trigger is 20% down of top of vp, trigger ends
          toggleClass: {targets: "#step-e", className: "onTop" }, // add a class at trigger. could use to make fixed
          toggleActions: "restart none none none"
        }
      }).to(".empty-container6", {
        scrollTrigger: {
          trigger: ".empty-container6",
          start: "top 50%", // when the animation starts
          end:() => `+=${document.querySelector(".empty-container6").offsetHeight}`, // when center of trigger is 20% down of top of vp, trigger ends
          toggleClass: {targets: "#step-f", className: "onTop" }, // add a class at trigger. could use to make fixed
          toggleActions: "restart none none none"
        }
      }).to(".empty-container7", {
        scrollTrigger: {
          trigger: ".empty-container7",
          start: "top 50%", // when the animation starts
          end:() => `+=${document.querySelector(".empty-container7").offsetHeight}`, // when center of trigger is 20% down of top of vp, trigger ends
          toggleClass: {targets: "#step-g", className: "onTop" }, // add a class at trigger. could use to make fixed
          toggleActions: "restart none none pause"
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
          },
       loadData() {
        const self = this;
        // read in data 
      
        
      },
      callback(data) {
        const self = this;
        // assign data

      }
    }
}
</script>
<style scoped lang="scss">
@import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;500;600;700;800&display=swap');
$SourceSans: 'Source Sans Pro', sans-serif;

section {
  background-color: pink;
}
img {
  max-width: 80vw;
}
#title-container {
  position: fixed;
  //top: 0;
}
.hydro-chart {
  height: auto;
  margin-top: 10%;
  margin-left: 10%;
}
// stacking al images and using toogleClass to change visibility with scrolling
#step-a {
  position: fixed;
  top: 10%;
  left: 0;
}
#step-b, #step-c, #step-d, #step-e, #step-f, #step-g {
  position: fixed;
  top: 10%;
  left: 0;
}
.chart-container {
  height: 90vh;
  position: relative;
  top:10vh;
  left: 0;
}
// currently empty scoll-by divs used to trigger animation
.empties {
  height: 100vh;
}
.onTop {
  visibility: visible;
  z-index: 100;
}
</style>