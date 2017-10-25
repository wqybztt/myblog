module.exports = class extends think.Model {
    async auth(name,password){
        let user = await this.where({name}).find();
        if(think.isEmpty(user)){
            return {error:'用户名输入错误,没有该用户'};
        }
        if(password!==user.password){
            return {error:'密码输入错误，请重新输入'};
        }
        delete user.password;
        return user;
    }
};
