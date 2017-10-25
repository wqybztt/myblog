const BaseRest = require('./rest.js');
module.exports = class extends BaseRest {
    async getAction() {
        let data;
        if (this.id) {
            const pk = await this.modelInstance.pk;
            data = await this.modelInstance.fieldReverse('password').where({[pk]: this.id}).find();
            return this.success(data);
        }
        data = await this.modelInstance.fieldReverse('password').select();
        return this.success(data);
    }
};
