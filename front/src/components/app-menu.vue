<template>
    <Menu theme="dark" accordion class="app-menu">
        <div v-for="(menu,i) in menus" :key="i+1">
            <MenuItem v-if="!menu.subs" :name="i+1">
                <router-link :to="menu.href" class="menu-link">{{menu.title}}</router-link>
            </MenuItem>
            <Submenu v-if="menu.subs" :name="i+1">
                <template slot="title">
                    {{menu.title}}
                </template>
                <MenuItem v-for="(sub,j) in menu.subs" :name="(i+1)+'-'+(j+1)" :key="(i+1)+'-'+(j+1)">
                    <router-link :to="sub.href">{{sub.title}}</router-link>
                </MenuItem>
            </Submenu>
        </div>
    </Menu>
</template>
<script>
    export default{
        name: 'app-menu',
        data () {
            return {
                menus:[{
                    title:'分类管理',
                    href:'/cate'
                },{
                    title:'资料管理',
                    href:'/material'
                },{
                    title:'文章管理',
                    href:'/article'
                },{
                    title:'图片上传',
                    href:'/upload'
                }]
            }
        }
    }
</script>
<style scoped>
    .app-menu{
        position: fixed;
        left: 0px;
        top: 60px;
        bottom: 0px;
        width: 200px!important;
        z-index: 999;
    }
    .menu-link{
        color: #fff;
    }
</style>