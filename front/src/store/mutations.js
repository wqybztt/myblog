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
    },
    [types.CATE_STATE_UPDATE](state,data){
        state.cate_state[data.key] = data.val;
    },
    [types.MATERIALS](state,data){
        state.material_total = data.total;
        state.materials = data.data;
    },
    [types.MATERIAL_ADD](state,data){
        state.materials.push(data);
    },
    [types.MATERIAL_GET](state,data){
        let cur = _.findIndex(state.materials,item=>{ return item.id==data.id; });
        if(cur==-1){
            state.materials.push(data);
        }else{
            state.materials[cur] = data;
        }
    },
    [types.MATERIAL_UPDATE](state,data){
        let cur = _.findIndex(state.materials,item=>{ return item.id==data.id; });
        if(cur==-1){
            state.materials.push(data);
        }else{
            state.materials[cur] = data;
        }
    },
    [types.MATERIAL_DELETE](state,id){
        let cur = _.findIndex(state.materials,item=>{ return item.id==id; });
        if(cur>=0) state.materials.splice(cur,1);
    },
    [types.MATERIAL_STATE_UPDATE](state,data){
        state.material_state[data.key] = data.val;
    }
}