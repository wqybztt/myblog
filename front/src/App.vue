<template>
  <div>
    <router-view name="blank"></router-view>
    <router-view name="main"></router-view>
  </div>
</template>

<script>
  export default {
    name: 'app',
    computed:{
      error(){
        return this.$store.state.error;
      }
    },
    watch:{
      error(error){
        this.$Notice.error({desc:error});
      }
    }
  }
</script>

<style>
</style>
