<template>
    <div class="wrap">
        <app-header></app-header>
        <app-menu></app-menu>
        <div class="container">
            <router-view></router-view>
        </div>
    </div>
</template>
<script>
    import AppHeader from '@/components/app-header';
    import AppMenu from '@/components/app-menu';
    export default{
        name: 'home-page',
        data () {
            return {
            }
        },
        components:{
            AppHeader,
            AppMenu
        }
    }
</script>
<style scoped>
    .wrap{
        position: absolute;
        top: 0px;
        right: 0px;
        bottom: 0px;
        left: 0px;
        padding-top: 60px;
        padding-left: 200px;
    }
    .container{
        width: 100%;
        padding: 15px;
    }
</style>