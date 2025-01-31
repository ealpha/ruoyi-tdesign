import { UniSmsConfig } from '@/pages/system/messageConfig/model';

/** 合一短信配置 */
export const uniSms: UniSmsConfig = {
  accessKeyId: {
    component: 'input',
    name: 'accessKeyId',
    required: true,
    help: '访问键标识',
  },
  accessKeySecret: {
    component: 'input',
    name: 'accessKeySecret',
    required: false,
    help: '访问键秘钥 简易模式不需要配置',
    type: 'password',
  },
  signature: {
    component: 'input',
    name: '默认短信签名',
    required: true,
  },
  isSimple: {
    value: true,
    component: 'switch',
    name: '简易模式',
    required: true,
    help: '是否为简易模式 默认为true',
  },
};
