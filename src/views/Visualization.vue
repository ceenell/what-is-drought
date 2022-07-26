<template>
  <div id="visualization">
    <DroughtThresholds />
  </div>
</template>

<script>

export default {
    name: 'Visualization',
    components: {
      DroughtThresholds: () => import( /* webpackPreload: true */ /*webpackChunkName: "section"*/ "./../components/DroughtThresholds")
    },
    computed: {
    },
    mounted(){
    },
    methods:{
    }
} 
</script>

<style lang="scss">
#visualization {
  //height: calc(100vh);
  margin: 2.5%;
  //width: 95%;
  //margin-top: 0;

}

#title-container {
  position: fixed;
  //top: 0;
}
</style>
