exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['e2e/*.js'],
  baseUrl: 'http://localhost:9292',
  onPrepare: function(){
    require('protractor-http-mock').config = {
      rootDirectory: process.cwd(),
      protractorConfig: 'test/protractor.conf.js'
    };
  }
};
