import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/pages/login'
import Home from '@/pages/home'
import Dash from '@/pages/dash'
import Cate from '@/pages/cate'

import Material from '../pages/material/main'
import MaterialList from '../pages/material/list'
import MaterialAdd from '../pages/material/add'
import MaterialEdit from '../pages/material/edit'
import Error from '@/pages/error'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/login',
      name: 'Login',
      components: {
        blank: Login
      }
    },
    {
      path: '/',
      name: 'Home',
      components: {
        main: Home
      },
      children: [{
        path: '',
        name: 'Dash',
        component: Dash
      }, {
        path: '/cate',
        name: 'Cate',
        component: Cate
      }, {
        path: '/material',
        name: 'Material',
        component: Material,
        children:[{
          path:'/',
          name:'MaterialList',
          component:MaterialList
        },{
          path:'add',
          name:'MaterialAdd',
          component:MaterialAdd
        },{
          path:'edit/:id',
          name:'MaterialEdit',
          component:MaterialEdit
        },{
          path:'*',
          redirect:'/material'
        }]
      }, {
        path: '*',
        name: 'Error',
        component: Error
      }]
    }
  ]
})
