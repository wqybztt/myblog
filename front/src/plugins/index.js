import _ from 'lodash';
import * as filters from './filters';//自定义过滤器

export default {
  install:function (Vue, options) {
    Vue.prototype._ = _;

    Object.keys(filters).forEach(key => {
      Vue.filter(key, filters[key])
    });

  }
}

