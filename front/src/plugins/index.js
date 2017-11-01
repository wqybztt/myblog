import _ from 'lodash';
import qs from 'querystring';
import * as filters from './filters';//自定义过滤器

export default {
  install:function (Vue, options) {
    Vue.prototype._ = _;
    Vue.prototype.$qs = qs;

    Object.keys(filters).forEach(key => {
      Vue.filter(key, filters[key])
    });

  }
}

