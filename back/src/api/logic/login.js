module.exports = class extends think.Logic {
  indexAction() {
    this.allowMethods = 'post';
    this.rules = {
      username: {
        aliasName: '用户名',
        string:true,
        required: true,
        trim: true,
        length:{min:6,max:12}
      },
      password:{
        aliasName: '密码',
        string: true,
        required: true,
        trim: true,
        length:{min:6,max:12}
      }
    };
  }
};
