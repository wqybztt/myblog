const fs = require('fs');
const path = require('path');
const moment = require('moment');

const Base = require('./base.js');
const rename = think.promisify(fs.rename, fs);
const UPLOAD_BASE_PATH = path.join(think.ROOT_PATH,'www/static/upload');
const UPLOAD_BASE_URL = '/static/upload/';

module.exports = class extends Base {
  async indexAction() {
    const file = this.file('file');
    const fileExt = path.extname(file.name);
    const fileName = moment().format('YYYYMMDDHHmmssx') + parseInt(Math.random()*100000000000000000) + fileExt;
    const filePath = path.join(UPLOAD_BASE_PATH,'images/'+fileName);
    think.mkdir(path.dirname(filePath));
    await rename(file.path, filePath);
    this.json({
      url:UPLOAD_BASE_URL+'images/'+fileName,
      name:fileName
    })
  }
};
