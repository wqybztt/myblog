<template>
    <Row>
        <Col span="12">
            <Form :model="material" :label-width="100" ref="materialAddForm" :rules="rules">
                <FormItem label="标题" prop="title">
                    <Input v-model="material.title" placeholder="标题"></Input>
                </FormItem>
                <FormItem label="URL" prop="url">
                    <Input v-model="material.url" placeholder="http://"></Input>
                </FormItem>
                <FormItem label="分类" prop="cate">
                    <Row>
                        <Col span="11">
                            <FormItem prop="cate">   
                                <Select placeholder="选择大分类" v-model="material.cate">
                                    <Option v-for="cate in cates" :value="cate.id" :key="cate.alias">{{cate.name}}</Option>
                                </Select>
                            </FormItem> 
                        </Col>
                        <Col span="11" offset="2" v-show="subcates.length">
                            <FormItem prop="subcate">
                                <Select placeholder="选择小分类" v-model="material.subcate">
                                    <Option v-for="cate in subcates" :value="cate.id" :key="cate.alias">{{cate.name}}</Option>
                                </Select>
                            </FormItem> 
                        </Col>
                    </Row>
                </FormItem>    
                <FormItem>
                    <Button type="primary" @click="submit()">提交</Button>
                    <Button type="ghost" @click="reset()" style="margin-left: 8px">返回列表</Button>
                </FormItem>
            </Form>
        </Col>
    </Row>
</template>
<script>
import types from '@/store/types'
export default{
    name: 'material-add-page',
    data () {
        return {
            material:{
                title:'',
                url:'',
                cate:'',
                subcate:''
            },
            subcates:[],
            rules:{
                title:[
                    {type:'string',required:true,message:'必须填写标题'}
                ],
                url:[
                    {type:'url',required:true,message:'必须为http(s)://开头的地址'}
                ],
                cate:[
                    {type:'number',required:true,message:'必须选择大分类'},
                ],
                subcate:[
                    {type:'number',required:true,message:'必须选择小分类'}
                ]
            }
        }
    },
    computed:{
        cates(){
            return this.$store.state.cates;
        },
        state(){
            return this.$store.state.material_state.add;
        }
    },
    watch:{
        ['material.cate'](id){
            ths.material.subcate = '';
            let cate = this._.find(this.cates,item=>{
                return item.id == id;
            });
            this.subcates = cate.subcates || [];
        },
        state(state){
            let msg = '添加新资料“'+this.material.title+'”';
            if(state==1){
                this.$Notice.success({
                    desc:msg+'成功',
                    duration:1,
                    onClose:()=>{
                        this.$router.push('/material');
                    }
                });
            }else if(state==2){
                this.$Notice.error({
                    desc:msg+'失败',
                    duration:1
                });
            }
        }
    },
    methods:{
        submit(){
            this.$refs['materialAddForm'].validate(vaild => {
                if(!vaild) return;
                this.$store.dispatch(types.MATERIAL_ADD,this.material);
            });
        },
        reset() {
            this.$router.push({name:'MaterialList'});
        }
    },
    created(){
        this.$store.commit(types.MATERIAL_STATE_UPDATE,{key:'add',val:0})
    }

}
</script>
<style scoped>
</style>