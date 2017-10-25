const Base = require('./base.js');

module.exports = class extends Base {
  async indexAction() {
    let username = this.post('username');
    let password = this.post('password');

    let model = this.model('user');
    let data = await model.auth(username,password);

    if(data.error){
      return this.fail(data.error);
    }
    return this.success(data);
  }
};
