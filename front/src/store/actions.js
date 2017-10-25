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
        delete data.id;
        api[types.CATE_UPDATE](id,data).then(res=>{
            let result = res.data;
            if(!result.status){
                commit(types.CATE_UPDATE,result.data);
            }else{
                commit(types.CATE_UPDATE,result.error);
            }
        }).catch(error=>{
            commit(types.ERROR,error.message);
        });
    }
}