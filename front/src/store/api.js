"use strict";
import axios from 'axios';
import types from  './types';

const INSTANCE = axios.create({
    baseURL:'/api',
    timeout:5000
});

export default {
    [types.USER_LOGIN](params){
        return INSTANCE.post('/login',params);
    },
    [types.USER_GET](uid){
        return INSTANCE.get('/user/'+uid);
    },
    [types.CATES](){
        return INSTANCE.get('/cate');
    },
    [types.CATE_ADD](data){
        return INSTANCE.post('/cate',data);
    },
    [types.CATE_DELETE](id){
        return INSTANCE.delete('/cate/'+id);
    },
    [types.CATE_UPDATE](id,data){
        return INSTANCE.put('/cate/'+id,data);
    }
}