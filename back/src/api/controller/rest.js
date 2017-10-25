const path = require('path');
const assert = require('assert');
const moment = require('moment')
module.exports = class extends think.Controller {
  constructor(ctx) {
    super(ctx);
    this.resource = this.getResource();
    this.id = this.getId();
    assert(think.isFunction(this.model), 'this.model must be a function');
    this.modelInstance = this.model(this.resource);
  }
  __before() {
  }
  /**
   * get resource
   * @return {String} [resource name]
   */
  getResource() {
    const filename = this.__filename || __filename;
    const last = filename.lastIndexOf(path.sep);
    return filename.substr(last + 1, filename.length - last - 4);
  }
  getId() {
    const id = this.get('id');
    if (id && (think.isString(id) || think.isNumber(id))) {
      return id;
    }
    const last = this.ctx.path.split('/').slice(-1)[0];
    if (last !== this.resource) {
      return last;
    }
    return '';
  }
  async getAction() {
    const cond = {
      deletetime: null
    };
    let data;
    if (this.id) {
      const pk = await this.modelInstance.pk;
      cond[pk] = this.id;
      data = await this.modelInstance.where(cond).find();
      return this.success(data);
    }
    data = await this.modelInstance.where(cond).select();
    return this.success(data);
  }
  /**
   * put resource
   * @return {Promise} []
   */
  async postAction() {
    const pk = await this.modelInstance.pk;
    const data = this.post();
    delete data[pk];
    if (think.isEmpty(data)) {
      return this.fail('data is empty');
    }
    data.createtime = moment().format('YYYY-MM-DD HH:mm:ss');
    const insertId = await this.modelInstance.add(data);
    const obj = await this.modelInstance.where({[pk]:insertId}).find();//返回详细数据
    return this.success(obj);
  }
  /**
   * delete resource
   * @return {Promise} []
   */
  async deleteAction() {
    if (!this.id) {
      return this.fail('params error');
    }
    const pk = await this.modelInstance.pk;
    const data = {
      deletetime:moment().format('YYYY-MM-DD HH:mm:ss')
    };
    const rows = await this.modelInstance.where({[pk]: this.id}).update(data);
    return this.success({affectedRows: rows});
  }
  /**
   * update resource
   * @return {Promise} []
   */
  async putAction() {
    if (!this.id) {
      return this.fail('params error');
    }
    const pk = await this.modelInstance.pk;
    const data = this.post();
    delete data[pk];
    if (think.isEmpty(data)) {
      return this.fail('data is empty');
    }
    data.edittime = moment().format('YYYY-MM-DD HH:mm:ss');
    const rows = await this.modelInstance.where({[pk]: this.id}).update(data);
    const obj = await this.modelInstance.where({[pk]:this.id}).find();//返回详细数据
    return this.success(obj);
  }
  __call() {

  }
};
