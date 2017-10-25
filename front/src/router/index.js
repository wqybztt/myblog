import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/login'
import Home from '@/components/home'
import Dash from '@/components/dash'
import Cate from  '@/pages/app-cate'
import Material from '@/pages/app-material'
import Error from  '@/pages/error'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/login',
      name: 'Login',
      components:{
        blank:Login
      }
    },
    {
      path:'/',
      name:'Home',
      components:{
        main:Home
      },
      children:[{
        path:'',
        name:'Dash',
        component:Dash
      },{
        path:'/cate',
        name:'Cate',
        component:Cate
      },{
        path:'/material',
        name:'Material',
        component:Material
      },{
        path:'*',
        name:'Error',
        component:Error
      }]
    }
  ]
})
