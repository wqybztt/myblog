<template>
    <Row>
        <Col span="24">
            <Upload multiple type="drag" action="/api/upload" ref="upload" :on-success="onSuccess" :show-upload-list="false">
                <div style="padding: 20px 0">
                    <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                    <p>Click or drag files here to upload</p>
                </div>
            </Upload>
        </Col>
        <Col span="24">
            <ul class="img-list">
                <li v-for="item in list">
                    <img :src="item.url" alt="item.name">
                </li>
            </ul>
        </Col>
    </Row>
</template>
<script>
    export default{
        name: 'upload-page',
        data () {
            return {
                list:[]
            }
        },
        methods:{
            onSuccess(file){
                this.list.push(file);
            }
        }
    }
</script>
<style scoped>
.img-list{
    margin-top: 15px;
}
.img-list li {
    width: 19%;
    height: 200px;
    float: left;
    margin-bottom: 15px;
    border: 1px dashed #ddd;
    margin-right: 1%;
    text-align: center;
}
.img-list li img{
    max-width: 100%;
    max-height: 100%;
}
</style>