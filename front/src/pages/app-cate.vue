<template>
    <Row>
        <Col span="18" offset="3" v-for="(cate,i) in cates" :key="(i+1)" class="pane">
            <Row class="pane-header">
                <Col span="8">
                    <Input v-model="cate.name">
                        <span slot="prepend">名称</span>
                    </Input>
                </Col>
                <Col span="8" offset="1">
                    <Input v-model="cate.alias">
                        <span slot="prepend">别名</span>
                    </Input>
                </Col>
                <Col span="4" offset="2">
                    <ButtonGroup v-if="!cate.id">
                        <Button type="success" @click="add(cate)">确认</Button>
                        <Button type="error" @click="cancel(cates,i)">取消</Button>
                    </ButtonGroup>
                    <ButtonGroup v-if="cate.id">
                        <Button type="primary" @click="update(cate)">修改</Button>
                        <Button type="error" :disabled="!!cate.subcates.length" @click="remove(cate)">删除</Button>
                    </ButtonGroup>
                </Col>
            </Row>
            <div class="pane-body" v-if="cate.id">
                <Row class="pane-sub" v-for="(sub,j) in cate.subcates" :key="(i+1)+'-'+(j+1)">
                    <Col span="8">
                        <Input v-model="sub.name">
                            <span slot="prepend">名称</span>
                        </Input>
                    </Col>
                    <Col span="8" offset="1">
                        <Input v-model="sub.alias">
                            <span slot="prepend">别名</span>
                        </Input>
                    </Col>
                    <Col span="4" offset="2">
                        <ButtonGroup v-if="!sub.id">
                            <Button type="success" @click="add(sub)">确认</Button>
                            <Button type="error" @click="cancel(cate.subcates,j)">取消</Button>
                        </ButtonGroup>
                        <ButtonGroup v-if="sub.id">
                            <Button type="primary" @click="update(sub)">修改</Button>
                            <Button type="error" @click="remove(sub)">删除</Button>
                        </ButtonGroup>
                    </Col>
                </Row>
                <Button type="primary" @click="addCate(cate.subcates,cate.id)">添加一个二级分类</Button>
            </div>
        </Col>
        <Col span="18" offset="3">
            <Button type="primary" @click="addCate(cates,0)">添加一个一级分类</Button>
        </Col>
    </Row>
</template>
<script>
import types from '@/store/types';
export default{
    name: 'app-cate-page',
    data () {
        return {
        }
    },
    computed:{
        cates(){
            return this.$store.state.cates;
        }
    },
    watch:{
    },
    methods:{
        addCate(cates,pid){
            let cate = {id:null,name:'',alias:'',pid:pid,createtime:null,edittime:null,deletetime:null};
            if(pid==0) {
                cate.subcates = {};
            }
            cates.push(cate);
            console.log(this.cates)
        },
        add(cate){
            if(!cate.name){
                return this.$store.commit(types.ERROR,'请填写分类名称');
            }
            if(!cate.alias){
                return this.$store.commit(types.ERROR,'请填写分类别名');
            }
            let params = {
                pid:cate.pid,
                name:cate.name,
                alias:cate.alias
            };
            this.$store.dispatch(types.CATE_ADD,params);
        },
        cancel(cates,i){
            cates.splice(i,1);
        },
        update(cate){

            if(!cate.name){
                return this.$store.commit(types.ERROR,'请填写分类名称');
            }
            if(!cate.alias){
                return this.$store.commit(types.ERROR,'请填写分类别名');
            }
            let data = {
                id:cate.id,
                name:cate.name,
                alias:cate.alias
            };
            this.$store.dispatch(types.CATE_UPDATE,data);

        },
        remove(cate){
            this.$store.dispatch(types.CATE_DELETE,cate.id);
        }
    },
    beforeCreate(){
        if(!this.$store.state.cates.length) this.$store.dispatch(types.CATES);
    }
}
</script>
<style scoped>
.pane,.pane-header,.pane-body,.pane-sub{
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}
.pane{
    padding-bottom: 0px;
}
</style>