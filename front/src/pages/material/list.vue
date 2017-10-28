<template>
    <div>
        <Row>
            <Col span="12">
                <Button type="primary" @click="add">添加一条记录</Button>
            </Col>
            <Col span="12">
                <Page :total="total" :current="page" :page-size="size" :page-size-opts="opts" @on-change="changePage" @on-page-size-change="changeSize" show-sizer  class="page"></Page>
            </Col>
        </Row>
        <Table :columns="columns" :data="list" stripe border highlight-row style="margin:15px 0px" :no-data-text="empty"></Table>
    </div>
</template>
<script>
import types from '@/store/types';
import {pageOpts} from '@/confing/index'
export default{
    name: 'material-list-page',
    data () {
        return {
            page:pageOpts.page,
            size:pageOpts.size,
            opts:pageOpts.opts,
            empty:"没有记录，请先添加记录！",
            del:{},
            columns:[{
                title:'ID',
                key:'id',
                width:60
            },{
                title:'标题(点击前往资料页面)',
                key:'title',
                render:(h,params)=>{
                    return h('a',{
                        domProps:{
                            title:params.row.url,
                            href:params.row.url
                        }
                    },params.row.title);
                }
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
                                    this.$router.push({name:'MaterialEdit',params:{id:params.row.id}});
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
            return this.$store.state.materials;
        },
        cates(){
            return this.$store.state.cates;
        },
        total(){
            return this.$store.state.material_total;
        },
        state(){
            return this.$store.state.material_state.del;
        }
    },
    watch:{
        page(page){
            this.$store.dispatch(types.MATERIALS,{page:page,size:this.size});
        },
        size(size){
            this.$store.dispatch(types.MATERIALS,{page:this.page,size:size});
        },
        state(state){
            let msg = '删除资料“'+this.del.title+'”';
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
        }
    },
    methods:{
        add(){
            this.$router.push({name:'MaterialAdd'});
        },
        delete(item){
            this.del = item;
            this.$store.dispatch(types.MATERIAL_DELETE,item.id);
        },
        changePage(page){
            this.page = page;
            return page;
        },
        changeSize(size){
            this.size = size;
            return size;
        }
    },
    created(){
        this.$store.dispatch(types.MATERIALS,{page:this.page,size:this.size});
    }
}
</script>
<style scoped>
.page{
    float: right;
}
</style>