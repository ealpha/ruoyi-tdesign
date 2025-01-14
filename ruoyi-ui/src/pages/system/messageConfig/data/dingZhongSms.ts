import { DingZhongSmsConfig } from '@/pages/system/messageConfig/model';

/** 鼎众短信配置 */
export const dingZhongSmsConfig: DingZhongSmsConfig = {
  accessKeyId: {
    component: 'input',
    name: 'cdkey',
    required: true,
    help: '短信帐号',
  },
  accessKeySecret: {
    component: 'input',
    name: 'password',
    required: true,
    help: '密码',
    type: 'password',
  },
  requestUrl: {
    component: 'input',
    name: '请求地址',
    required: true,
    value: 'http://demoapi.321sms.com:8201',
    help: '短信发送请求地址： （演示及测试域名：http://demoapi.321sms.com:8201；正式域名：http://api.321sms.com）',
  },
};
