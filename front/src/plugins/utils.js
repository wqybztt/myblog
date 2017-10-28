import _ from 'lodash';

//分类分组
export const catesGroup = list => {
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