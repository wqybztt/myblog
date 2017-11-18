// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from  './store'

import iView from 'iview'
import 'iview/dist/styles/iview.css'
Vue.use(iView)

import 'font-awesome/css/font-awesome.css'

import plugins from './plugins'
Vue.use(plugins)

Vue.config.productionTip = false

import types from './store/types';

router.beforeEach((to, from, next) => {
  if (to.path == '/login') {//如果是去登录页则清空 用户登录信息
    sessionStorage.removeItem('uid');
    next();
  }else{
    let uid = sessionStorage.getItem('uid');
    if(!uid) {
      next({ path: '/login' });
    }else{
      if(!store.state.user.id){//如果没有用户信息则去服务器请求
        store.dispatch(types.USER_GET,uid);
      }
      next();
    }
  }
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: { App }
})
