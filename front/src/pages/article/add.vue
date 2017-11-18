<template>
    <Row>
        <Col span="18">
            <Form :model="article" :label-width="100" ref="articleAddForm" :rules="rules">
                <FormItem label="标题" prop="title">
                    <Input v-model="article.title" placeholder="标题"></Input>
                </FormItem>
                <FormItem label="简介" prop="desc">
                    <Input v-model="article.desc" type="textarea" :rows="3" placeholder="简介"></Input>
                </FormItem>
                <FormItem label="分类" prop="cate">
                    <Row>
                        <Col span="5">
                            <FormItem prop="cate">   
                                <Select placeholder="选择大分类" v-model="article.cate" :filterable="true">
                                    <Option v-for="cate in cates" :value="cate.id" :key="cate.alias">{{cate.name}}</Option>
                                </Select>
                            </FormItem> 
                        </Col>
                        <Col span="5" offset="1">
                            <FormItem prop="subcate">
                                <Select placeholder="选择小分类" v-model="article.subcate" :filterable="true">
                                    <Option v-for="cate in subcates" :value="cate.id" :key="cate.alias">{{cate.name}}</Option>
                                </Select>
                            </FormItem> 
                        </Col>
                    </Row>
                </FormItem>
                <FormItem label="内容" prop="content">
                    <app-editor :id="'editor_'+(+new Date())" v-model="article.content" :config="{}"></app-editor>
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
import types from '@/store/types';
import AppEditor from '@/components/app-editor';
export default{
    name: 'article-add-page',
    components:{
        AppEditor
    },
    data () {
        return {
            article:{
                title:'',
                desc:'',
                cate:'',
                subcate:'',
                content:''
            },
            subcates:[],
            rules:{
                title:[
                    {type:'string',required:true,message:'必须填写标题'}
                ],
                desc:[
                    {type:'string',required:true,message:'必须填写简介'}
                ],
                cate:[
                    {type:'number',required:true,message:'必须选择大分类'},
                ],
                subcate:[
                    {type:'number',required:true,message:'必须选择小分类'}
                ],
                content:[
                    {type:'string',required:true,message:'必须填写内容'}
                ]
            }
        }
    },
    computed:{
        cates(){
            return this.$store.state.cates;
        },
        state(){
            return this.$store.state.article_state.add;
        }
    },
    watch:{
        ['article.cate'](id){
            let cate = this._.find(this.cates,item=>{
                return item.id == id;
            });
            this.subcates = cate.subcates || [];
        },
        state(state){
            let msg = '添加新文章“'+this.article.title+'”';
            if(state==1){
                this.$Notice.success({
                    desc:msg+'成功',
                    duration:1,
                    onClose:()=>{
                        this.$router.push('/article');
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
            this.$refs['articleAddForm'].validate(vaild => {
                if(!vaild) return;
                this.$store.dispatch(types.ARTICLE_ADD,this.article);
            });
        },
        reset() {
            this.$router.push({name:'AtricleList'});
        }
    },
    created(){
        this.$store.commit(types.ARTICLE_STATE_UPDATE,{key:'add',val:0})
    }
}
</script>
<style scoped>
</style>