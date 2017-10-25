"use strict";
import _ from 'lodash';
import types from './types';
import * as utils from '../plugins/utils'
export default {
    [types.ERROR](state,error){
        state.error = error;
    },
    [types.USER_LOGIN](state,user){
        sessionStorage.setItem('uid',user.id);
        state.user = user;
        state.logined = true;
    },
    [types.USER_LOGINOUT](state){
        sessionStorage.removeItem('uid');
        state.user = {};
        state.logined = false;
    },
    [types.CATES](state,data){
        state.cates = utils.catesGroup(data);
    },
    [types.CATE_DELETE](state,id){
        let cates = state.cates;
        for(let i=cates.length-1;i>=0;i--){
            if(cates[i].id==id){
                state.cates.splice(i,1);
            }else{
                for(let j=cates[i].subcates.length-1;j>=0;j--){
                    if(cates[i].subcates[j].id==id){
                        state.cates[i].subcates.splice(j,1);
                    }
                }
            }
        }
    },
    [types.CATE_UPDATE](state,data){
        let cates = state.cates;
        if(data.pid==0){
            let idx = _.findIndex(cates,item=>{
                return item.name == data.name;
            });
            for (let o in data){
                state.cates[idx][o] = data[o];
            }
        }else{
            let idx = _.findIndex(cates,item=>{
                return item.id == data.pid;
            });
            let s_idx = _.findIndex(cates[idx].subcates,item=>{
                return item.name == data.name;
            });
            for (let o in data){
                state.cates[idx].subcates[s_idx][o] = data[o];
            }
        }
    }
}