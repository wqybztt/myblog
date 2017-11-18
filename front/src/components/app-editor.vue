<template>
    <div>
        <script :id="id" type="text/plain"></script>
    </div>
</template>
<script>
import '../../static/ueditor/ueditor.config.js'
import '../../static/ueditor/ueditor.all.min.js'
import '../../static/ueditor/lang/zh-cn/zh-cn.js'
import '../../static/ueditor/ueditor.parse.min.js'
export default{
    name:'app-editor',
    props:{
        id:{
            type:String,
            default:'editor_'+(+new Date())
        },
        config:{
            type:Object,
            default:{}
        },
        value:{
            type:String,
            default:''
        }
    },
    data(){
        return {
            editor:null
        }
    },
    mounted(){
        this.editor = UE.getEditor(this.id,this.config);
        this.editor.addListener("ready",()=>{
            this.editor.setContent(this.value);
        });
        this.editor.addListener('contentChange',() => {
            this.$emit('input',this.editor.getContent());
        });
    },
    methods:{
    },
    beforeDestroy(){
        this.editor.destroy();
        this.editor = null;
    }
}
</script>
<style scoped>
</style>