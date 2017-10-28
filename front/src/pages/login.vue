<template>
    <Row type="flex">
        <Col span="5" offset="9">
        <h1 class="login-title">用户登录</h1>
        <Form ref="loginForm" :model="formData" :rules="rules">
            <FormItem prop="username">
                <Input size="large" placeholder="用户名" v-model="formData.username">
                <Icon type="person" slot="prepend"></Icon>
                </Input>
            </FormItem>

            <FormItem prop="password">
                <Input size="large" type="password" placeholder="密码"  v-model="formData.password">
                <Icon type="locked" slot="prepend"></Icon>
                </Input>
            </FormItem>

            <FormItem>
                <Button type="primary" size="large" long @click="login('loginForm')">登录</Button>
            </FormItem>

            <FormItem>
                <Button size="large" long @click="reset('loginForm')">重置</Button>
            </FormItem>
        </Form>
        </Col>
    </Row>
</template>
<script>
    import types from '@/store/types'
    export default{
        name: 'login-page',
        data () {
            const validateUsername = (rule,username,cb) => {
                if(!username){
                    cb(new Error('用户名不能为空'));
                }else if(username.length<6){
                    cb(new Error('用户名不能小于6位'));
                }else{
                    cb()
                }
            };
            const validatePassword =  (rule,password,cb) => {
                if(!password){
                    cb(new Error('密码不能为空'));
                }else if(password.length<6){
                    cb(new Error('密码不能小于6位'));
                }else{
                    cb();
                }
            };
            return {
                formData:{
                    username:'',
                    password:''
                },
                rules:{
                    username:[
                        {validator:validateUsername,trigger:'blur'}
                    ],
                    password:[
                        {validator:validatePassword,trigger:'blur'}
                    ]
                }
            }
        },
        computed:{
            logined(){
                return this.$store.state.logined;
            }
        },
        watch:{
            logined(sta){
                if(sta) this.$router.push('/');
            }
        },
        methods:{
            login(name) {
                this.$refs[name].validate(vaild => {
                    if(vaild){
                        let params = {
                            username:this.formData.username,
                            password:this.formData.password
                        };
                        this.$store.dispatch(types.USER_LOGIN,params);
                    } else {
                        this.$store.state.error = '用户名／密码错误，请重新填写';
                    }
                });
            },
            reset(name) {
                this.$refs[name].resetFields();
            }
        }
    }
</script>
<style scoped>
    .login-title{
        text-align: center;
        margin-top: 100px;
        margin-bottom: 30px;
    }
</style>