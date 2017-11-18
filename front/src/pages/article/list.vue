<template>
    <div>
        <Row>
            <Col span="19">
                <Button type="primary" @click="add">添加一条记录</Button>
            </Col>
            <Col span="2">
                <Select placeholder="选择大分类" v-model="cate" :filterable="true">
                    <Option v-for="cate in cates" :value="cate.id" :key="cate.alias">{{cate.name}}</Option>
                </Select>
            </Col>
            <Col span="2" offset="1">
                <Select placeholder="选择小分类" v-model="subcate" :filterable="true">
                    <Option v-for="cate in subcates" :value="cate.id" :key="cate.alias">{{cate.name}}</Option>
                </Select>
            </Col>
        </Row>
        <Table :columns="columns" :data="list" stripe border highlight-row style="margin:15px 0px" :no-data-text="empty"></Table>
        <Row>
            <Col span="24">
                <Page :total="total" :current="page" :page-size="size" :page-size-opts="opts" @on-change="changePage" @on-page-size-change="changeSize" show-sizer  class="page"></Page>
            </Col>
        </Row>
    </div>
</template>
<script>
import {pageOpts} from '@/confing/index';
import types from '@/store/types';
export default{
    name: 'article-list-page',
    data () {
        return {
            cate:'',
            subcate:'',
            subcates:[],
            page:pageOpts.page,
            size:pageOpts.size,
            opts:pageOpts.opts,
            empty:"没有记录，请先添加记录！",
            columns:[{
                title:'ID',
                key:'id',
                width:60
            },{
                title:'标题',
                key:'title'
            },{
                title:'简介',
                key:'desc'
            },{
                title:'分类',
                key:'cate',
                width:150,
                render:(h,params) => {
                    let cate = this._.find(this.cates,item=>{
                        return item.id == params.row.cate;
                    });
                    let subcate = this._.find(cate.subcates,item=>{
                        return item.id==params.row.subcate;
                    });
                    return h('div',cate.name+' / '+subcate.name);
                }
            },{
                title:'添加时间',
                key:'createtime',
                width:150,
                sortable:true,
                sortType:'desc'
            },{
                title: '操作',
                key: 'action',
                width:125,
                render: (h, params) => {
                    return h('div', [
                        h('Button', {
                            props: {
                                type: 'primary',
                                size: 'small'
                            },
                            style: {
                                marginRight: '5px'
                            },
                            on: {
                                click: () => {
                                    this.$router.push({name:'ArticleEdit',params:{id:params.row.id}});
                                }
                            }
                        }, '编辑'),
                        h('Button', {
                            props: {
                                type: 'error',
                                size: 'small'
                            },
                            on: {
                                click: () => {
                                    this.delete(params.row)
                                }
                            }
                        }, '删除'),
                    ]);
                }
            }]
        }
    },
    computed:{
        list(){
            return this.$store.state.articles;
        },
        cates(){
            return this.$store.state.cates;
        },
        total(){
            return this.$store.state.article_total;
        },
        state(){
            return this.$store.state.article_state.del;
        }
    },
    watch:{
        page(page){
            this.loaddata();
        },
        size(size){
            this.loaddata();
        },
        state(state){
            let msg = '删除文章“'+this.del.title+'”';
            if(state==1){
                msg += '成功'
            }else if(state==2){
                msg += '失败'
            }
            this.$Notice.success({
                desc:msg,
                duration:1
            });
            this.del = {};
        },
        cate(id){
            this.subcate = '';
            let cate = this._.find(this.cates,item=>{ return item.id == id;});
            this.subcates = cate.subcates || [];
            if(this.page == 1){
                this.loaddata();
            }else{
                this.page = 1;
            }
        },
        subcate(id){
            if(!id) return;
            if(this.page == 1){
                this.loaddata();
            }else{
                this.page = 1;
            }
        }
    },
    methods:{
        add(){
            this.$router.push({name:'ArticleAdd'});
        },
        delete(item){
            this.del = item;
            this.$store.dispatch(types.ARTICLE_DELETE,item.id);
        },
        changePage(page){
            this.page = page;
            return page;
        },
        changeSize(size){
            this.size = size;
            return size;
        },
        loaddata(){
            let filterStr = this.getFilter();
            let data = {page:this.page,size:this.size};
            if(filterStr) data.filter = filterStr;
            this.$store.dispatch(types.ARTICLES,data);
        },
        getFilter(){
            let data = {};
            if(this.cate) data.cate = this.cate;
            if(this.subcate) data.subcate = this.subcate;
            return this.$qs.stringify(data);
        }
    },
    mounted(){
        this.loaddata();
    }
}
</script>
<style scoped>
</style>