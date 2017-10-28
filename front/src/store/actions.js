"use strict";
import api from './api';
import types from './types';

export default {
    [types.USER_LOGIN]({commit},params){
        api[types.USER_LOGIN](params).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.USER_LOGIN,result.data);
            }else{
                commit(types.ERROR,result.error);
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    },
    [types.USER_GET]({commit},uid){
        api[types.USER_GET](uid).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.USER_LOGIN,result.data);
            }else{
                commit(types.ERROR,result.error);
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    },
    [types.CATES]({commit}){
        api[types.CATES]().then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.CATES,result.data);
            }else{
                commit(types.ERROR,result.error);
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    },
    [types.CATE_ADD]({commit},data){
        api[types.CATE_ADD](data).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.CATE_UPDATE,result.data);
            }else{
                commit(types.ERROR,result.error);
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    },
    [types.CATE_DELETE]({commit},id){
        api[types.CATE_DELETE](id).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.CATE_DELETE,id);
            }else{
                commit(types.ERROR,result.error);
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    },
    [types.CATE_UPDATE]({commit},data){
        let id = data.id;
        api[types.CATE_UPDATE](id,data).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.CATE_UPDATE,result.data);
            }else{
                commit(types.ERROR,result.error);
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    },
    [types.MATERIALS]({commit},conf){
        api[types.MATERIALS](conf).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.MATERIALS,result.data);
            }else{
                commit(types.ERROR,result.error);
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    },
    [types.MATERIAL_ADD]({commit},data){
        api[types.MATERIAL_ADD](data).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.MATERIAL_STATE_UPDATE,{key:'add',val:1});
                commit(types.MATERIAL_ADD,result.data);
            }else{
                commit(types.MATERIAL_STATE_UPDATE,{key:'add',val:2});
                commit(types.ERROR,result.error);
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    },
    [types.MATERIAL_GET]({commit},id){
        api[types.MATERIAL_GET](id).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.MATERIAL_GET,result.data);
            }else{
                commit(types.ERROR,'未查到ID为'+id+'的资料信息');
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    },
    [types.MATERIAL_UPDATE]({commit},data){
        let id = data.id;
        api[types.MATERIAL_UPDATE](id,data).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.MATERIAL_STATE_UPDATE,{key:'edit',val:1});
                commit(types.MATERIAL_UPDATE,result.data);
            }else{
                commit(types.MATERIAL_STATE_UPDATE,{key:'edit',val:2});
                commit(types.ERROR,result.error);
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    },
    [types.MATERIAL_DELETE]({commit},id){
        api[types.MATERIAL_DELETE](id).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.MATERIAL_STATE_UPDATE,{key:'del',val:1});
                commit(types.MATERIAL_DELETE,id);
            }else{
                commit(types.MATERIAL_STATE_UPDATE,{key:'del',val:2});
                commit(types.ERROR,result.error);
            }

        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    }
}