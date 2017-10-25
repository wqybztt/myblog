import _ from 'lodash';

//分类分组
export const catesGroup = list => {
    /*
    var cates = {};
    _.forEach(list,item => {
        if(item.pid==0){
            item.subcates = {};
            cates[item.id] = item;
        }
    });
    _.forEach(list, item => {
        if(item.pid>0 && cates[item.pid]){
            cates[item.pid].subcates[item.id] = item;
        }
    });
    return cates;
    */

    var cates = [];
    _.forEach(list,function (item) {
        if(item.pid==0){
            item.subcates = [];
            cates.push(item);
        }
    });
    _.forEach(list,function (item) {
        let idx = _.findIndex(cates,function (cate) {
            return cate.id == item.pid;
        });
        if(idx>=0){
            cates[idx].subcates.push(item);
        }
    });
    return cates;

};