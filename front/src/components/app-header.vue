<template>
    <div class="app-header">
        <div class="app-logo"><a href="/">LOGO</a></div>
        <ul class="app-user-nav">
            <li><a>{{user.name}}</a></li>
            <li><a @click="logout()">退出</a></li>
        </ul>
    </div>
</template>
<script>
    import types from '../store/types';
    export default{
        name: 'app-header',
        data () {
            return {
            }
        },
        computed:{
            user(){
                return this.$store.state.user;
            },
            logined(){
                return this.$store.state.logined;
            }
        },
        methods:{
            logout(){
                this.$store.commit(types.USER_LOGINOUT);
            }
        },
        watch:{
            logined(status){
                if(!status) this.$router.push('/login');
            }
        }
    }
</script>
<style scoped>
    .app-header{
        position: fixed;
        left: 0px;
        right: 0px;
        top: 0px;
        height: 60px;
        background: #495060;
        z-index: 999;
    }
    .app-logo{
        float: left;
        width: 200px;
        height: 60px;
        line-height: 60px;
        text-align: center;
        background: #5b6270;
        font-size: 22px;
        font-weight: bold;
    }
    .app-logo a{
        color: #fff;
    }
    .app-user-nav{
        float: right;
        height: 60px;
    }
    .app-user-nav li{
        float: left;
        padding: 0px 15px;
        height: 60px;
        line-height: 60px;
        font-size: 14px;
    }
    .app-user-nav li,.app-user-nav li a{
        color: #fff;
    }
</style>